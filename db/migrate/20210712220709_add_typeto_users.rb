class AddTypetoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :initiator_type, :string,null: false, default: "Student"
  end
end
