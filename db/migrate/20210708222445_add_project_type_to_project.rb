class AddProjectTypeToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :image_url, :string, default:""
  end
end
