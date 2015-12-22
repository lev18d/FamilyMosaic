class AddChaptersEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :chapter
  end
end
