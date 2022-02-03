class AddDescriptionToVolunteerGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteer_groups, :description, :string, default:"Used for personal project", null:false
  end
end
