class AddDimensionsToContents < ActiveRecord::Migration
  def change
    add_column :contents, :dimensions, :string
  end
end
