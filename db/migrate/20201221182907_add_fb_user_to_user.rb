class AddFbUserToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fb_user, :boolean, default: false
  end
end
