class RemoveDefaultPhotoFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, nil
  end
end
