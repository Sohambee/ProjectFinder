class AddCategoriesToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :category, :string,array: true, null: false, default: []
  end
end
