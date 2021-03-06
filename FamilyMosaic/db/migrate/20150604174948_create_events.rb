class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :link_event
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :creator_id
      t.timestamps
    end
  end
end
