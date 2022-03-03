require 'json'

class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy, :toggle_volunteer, :volunteered, :own, :volunteers ]
  before_action :set_project, only: [ :show, :edit, :update, :destroy, :toggle_volunteer, :volunteers ]
  before_action :ensure_owner_or_admin, only: [ :edit, :update, :destroy, :volunteers ]
  before_action :set_filters_open, only: :index
  before_action :set_projects_query, only: :index
  before_action :hydrate_project_categories, only: :index
  before_action :ensure_no_legacy_filtering, only: :index
  before_action :set_bg_white, only: [:index, :own, :volunteered]

  def index
    params[:page] ||= 1
    @show_filters = true
    @show_search_bar = true
    @show_sorting_options = true
    @show_global_announcements = false
    @applied_filters = params.dup


    if (request.path != projects_path) && params[:category_slug].present?
      @project_category = Settings.project_categories.find { |category| category.slug == params[:category_slug] }

      raise ActionController::RoutingError, 'Not Found' if @project_category.blank?

      if @project_category.present?
        @projects= Project
        array=[@project_category.name]
        @projects = @projects.where('? = ANY(category)', array) if @project_category.present?
        @featured_projects = @projects

      end
    else
      @featured_projects = Project.get_featured_projects
    end

    respond_to do |format|
      format.html do
        @projects_header = I18n.t('projects_looking_for_volunteers')
        @projects_subheader = I18n.t('new_or_established_projects_helping_with')
        @page_title = I18n.t('all_projects')

        @projects = @projects.page(params[:page]).per(24)

        @index_from = (@projects.prev_page || 0) * @projects.limit_value + 1
        @index_to = [@index_from + @projects.limit_value - 1, @projects.total_count].min
        @total_count = @projects.total_count
      end
      format.json do
        render json: @projects
      end
    end
  end

  def volunteered
    params[:page] ||= 1

    @projects = current_user.volunteered_projects.page(params[:page]).per(25)
    @index_from = (@projects.prev_page || 0) * @projects.limit_value + 1
    @index_to = [@index_from + @projects.limit_value - 1, @projects.total_count].min

    @projects_header = I18n.t('volunteered_projects')
    @projects_subheader = I18n.t('these_are_the_projects_where_you_volunteered')
    @page_title = I18n.t('volunteered_projects')
    render action: 'index'
  end

  def own
    params[:page] ||= 1

    @projects = current_user.projects.page(params[:page]).per(25)

    @index_from = (@projects.prev_page || 0) * @projects.limit_value + 1
    @index_to = [@index_from + @projects.limit_value - 1, @projects.total_count].min

    @projects_header = I18n.t('own_projects')
    @projects_subheader = I18n.t('these_are_the_projects_you_created')
    @page_title = I18n.t('own_projects')
    render action: 'index'
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end

    @project.views = @project.views+1
    @project.save!
  end

  def volunteers
    respond_to do |format|
      format.csv { send_data @project.volunteered_users.to_csv, filename: "volunteers-#{Date.today}.csv" }
    end
  end

  def new
    @project = Project.new
    track_event 'Project creation started'
  end

  def create
      categories=project_params[:category].first().split(',')
      logger.info categories.first().first()
      projectParams= project_params
      projectParams[:category] = categories
      categories.each do |category|
       if Categorie.where(category: category).length()==0
         cat = Categorie.create(category: category)
         cat.save!
       end
     end
      @project = current_user.projects.new(projectParams)

      respond_to do |format|
        if @project.save
          track_event 'Project creation complete'
          @project.project_initiator= @current_user.username
          @project.save!
          format.html { redirect_to @project, notice: I18n.t('project_was_successfully_created') }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
    @projectInstance = Project.where(id: params[:id])
    logger.info @projectInstance.inspect
  end

  def update
      categories =project_params[:category].first().split(',')
      logger.info categories.first().first()
      projectParams= project_params
      projectParams[:category] = categories
      categories.each do |category|
       if Categorie.where(category: category).length()==0
         cat = Categorie.create(category: category)
         cat.save!
       end
     end
      updated = @project.update(projectParams)
      respond_to do |format|
        if updated
          format.html { redirect_to @project, notice: I18n.t('project_was_successfully_updated') }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
  end



  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: I18n.t('project_was_successfully_deleted') }
      format.json { head :no_content }
    end
  end

  def toggle_volunteer
    @user= User.where(id: current_user.id)[0]
    @user.project_ids.push(@project.id)
    @user.save!
    @project.user_ids.push({ id: current_user.id, username: current_user.username, description: params[:note], role: current_user.initiator_type })
    @project.save!

    flash[:notice] = 'Project added to used'


    redirect_to project_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.fetch(:project, {}).permit(:name, :description, :requirements, :steps, :docs_and_demo, :links, :short_description, :image, :image_url, category: [])
    end

    def ensure_owner_or_admin
      if !@project.can_edit?(current_user)
        flash[:error] = I18n.t('apologies_you_don_t_have_access_to_this')
        redirect_to projects_path
      end
    end


    def is_valid_link(link)
      if link.include?('images.unsplash.com/photo') || link.empty?
        true
      else
        false
      end
    end


    def set_projects_query
      @applied_filters = {}

      @projects = Project
      @projects = @projects.tagged_with(params[:skills], any: true, on: :skills) if params[:skills].present?
      @projects = @projects.tagged_with(params[:project_types], any: true, on: :project_types) if params[:project_types].present?
      @projects = @projects.where('project_initiator IN (?)', params[:project_initiator]) if params[:project_initiator].present?
      @projects = @projects.where(accepting_volunteers: params[:accepting_volunteers] == '1') if params[:accepting_volunteers].present?
      @projects = @projects.where(highlight: true) if params[:highlight].present?
      @projects = @projects.where(target_country: params[:target_country]) if params[:target_country].present?
      @projects = @projects.where(status: params[:status]) if params[:status].present?



      if params[:query].present?
        @projects = @projects.search(params[:query]).left_joins(:volunteers).reorder(nil).group(:id)
      else
        @projects = @projects.left_joins(:volunteers).group(:id)
      end

      if params[:sort_by]
        @projects = @projects.order(get_order_param)
      else
        @projects = @projects.order('highlight DESC, COUNT(volunteers.id) DESC, created_at DESC')
      end

      if params[:project_types].present?
        @applied_filters[:project_types] = params[:project_types]
      end

      if params[:project_initiator].present?
        @applied_filters[:project_initiator] = params[:project_initiator]
      end

      if params[:skills].present?
        @applied_filters[:skills] = params[:skills]
      end

      @projects = @projects.includes(:project_types, :skills, :volunteers)
    end

    def ensure_no_legacy_filtering
      new_params = {}

      if params[:skills].present? && params[:skills].include?(',')
        new_params[:skills] = params[:skills].split(',')
      end

      if params[:project_types].present? && params[:project_types].include?(',')
        new_params[:project_types] = params[:project_types].split(',')
      end

      return redirect_to projects_path(new_params) if new_params.present?
    end

    def get_order_param
      return 'created_at asc' if params[:sort_by] == 'earliest'
      return 'created_at desc' if params[:sort_by] == 'latest'
      return 'volunteers.count asc' if params[:sort_by] == 'volunteers_needed'
    end
end
