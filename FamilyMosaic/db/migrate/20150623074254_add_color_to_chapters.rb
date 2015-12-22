class AddColorToChapters < ActiveRecord::Migration
  def change
  	add_column :chapters, :color, :string
  end
end
