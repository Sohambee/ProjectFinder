class AddTagsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :tags, :string, array: true, default: [], null: false
  end
end
