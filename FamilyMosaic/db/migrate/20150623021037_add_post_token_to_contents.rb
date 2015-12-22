class AddPostTokenToContents < ActiveRecord::Migration
  def change
    add_column :contents, :post_token, :string
  end
end
