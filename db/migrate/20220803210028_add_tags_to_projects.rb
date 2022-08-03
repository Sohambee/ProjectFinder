class AddTagsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :tags, :string, array: true, null: false, default: []
  end
end
