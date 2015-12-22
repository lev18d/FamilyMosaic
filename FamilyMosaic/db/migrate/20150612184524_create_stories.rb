class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :family_id
      t.integer :profile_id
      t.string :name
      t.text :story
      t.date :date
      t.integer :creator_id
      t.timestamps
    end
  end
end
