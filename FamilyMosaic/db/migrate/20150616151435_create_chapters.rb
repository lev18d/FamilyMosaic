class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
    	t.string :chapter_name
    	t.date :start_date
    	t.date :end_date
    end
  end
end
