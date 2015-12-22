class AddChaptersToStories < ActiveRecord::Migration
  def change
  	add_reference :stories, :chapter
  end
end
