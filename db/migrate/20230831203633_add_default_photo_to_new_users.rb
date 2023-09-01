class AddDefaultPhotoToNewUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: "https://randomuser.me/api/portraits/men/10.jpg"
  end
end
