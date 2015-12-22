class AddTokenToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :token, :string
  end
end

