class AddOAuthProps < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :fb_img, :string
  end
end
