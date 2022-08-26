class AddApprovedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :approved, :boolean, default: false, null: false
  end

  def up
    change_column :projects, :approved, :boolean, default: false, null: false
  end
end
