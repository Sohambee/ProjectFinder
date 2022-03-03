class AddRequirementsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :requirements, :string
  end
end
