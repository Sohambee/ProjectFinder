class AddUsersToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :user_ids, :jsonb, array: true, default: []
  end
end
