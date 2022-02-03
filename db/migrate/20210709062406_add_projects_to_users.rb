class AddProjectsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :project_ids, :integer, array:true, default:[], null:false
  end
end
