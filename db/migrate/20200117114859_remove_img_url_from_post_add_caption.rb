class RemoveImgUrlFromPostAddCaption < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :img_url, :string
    add_column :posts, :caption, :string
  end
end
