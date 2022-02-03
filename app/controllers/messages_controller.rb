class MessagesController < ApplicationController
  before_action do
     @conversation = Conversation.find(params[:conversation_id])
   end

  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.where('sender_id = (?) OR recipient_id = (?)', current_user.id, current_user.id)
    @conversations = @conversations.includes(:last_message).order('messages.created_at DESC')

    if !@conversation.last_message.blank?
        if @conversation.last_message.user_id != current_user.id
          @conversation.last_message.read=true
          @conversation.last_message.save!
        end
    end

    @messages = @conversation.messages
    logger.info @conversation.last_message.inspect



    if @conversation.sender_id == @current_user.id
      @user = User.find(@conversation.recipient_id)
    else
      @user = User.find(@conversation.sender_id)
    end

    logger.info @user.username

    if @messages.length > 100
      @over_ten = true
      @messages = @messages[-100..-1]
    end


    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @message = @conversation.messages.new
 end


  def getData
    @users = User.all
    @conversations = Conversation.joins('INNER JOIN users a ON a.id = conversations.sender_id').
                    select('conversations.*,a.username as sender_name').
                    joins('INNER JOIN users b ON b.id = conversations.recipient_id').
                    select('conversations.*,b.username as reciever_name').
                    joins("INNER JOIN  (
                        SELECT    MAX(created_at),conversation_id
                        FROM      messages
                        GROUP BY  conversation_id
                    ) m ON m.conversation_id = conversations.id").
                    select('conversations.*, messages.body,messages.read, messages.user_id').
                    where('sender_id = (?) OR recipient_id = (?)', current_user.id, current_user.id)


    @conversations = @conversations.includes(:last_message).order('messages.created_at DESC')


    if @conversation.last_message.user_id != current_user.id
      @conversation.last_message.read=true
      @conversation.last_message.save!
    end

    @messages = @conversation.messages
    logger.info @conversations



    if @conversation.sender_id == @current_user.id
      @user = User.find(@conversation.recipient_id)
    else
      @user = User.find(@conversation.sender_id)
    end

    logger.info @user.username

    if @messages.length > 100
      @over_ten = true
      @messages = @messages[-100..-1]
    end


    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @json = { messages: @messages, conversations: @conversations, user: current_user.id }

    respond_to do |format|
      format.json { render json: @json }
    end
  end


  def new
    @message = @conversation.messages.new
  end


  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end


   private
     def message_params
       params.require(:message).permit(:body, :user_id)
     end
end
