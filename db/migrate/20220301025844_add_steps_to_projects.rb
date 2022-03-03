class AddStepsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :steps, :string
  end
end
