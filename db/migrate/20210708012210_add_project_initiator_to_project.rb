class AddProjectInitiatorToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :project_initiator, :string,null: false, default: "Student"
  end
end
