class AddApprovedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :approved, :boolean
  end

  def up
    change_column :projects, :approved, :boolean, default: false
  end
  
  def down
    change_column :projects, :approved, :boolean, default: nil
  end
end
