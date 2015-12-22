class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :description
      t.integer :creator_id
      t.timestamps
    end
  end
end
