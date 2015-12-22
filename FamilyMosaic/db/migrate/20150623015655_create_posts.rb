class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :story
      t.integer :cover
      t.integer :family_id
      t.integer :profile_id
      t.date :date
      t.integer :creator_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end

