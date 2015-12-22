class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :family_id
      t.text :history
      t.timestamps
    end
  end
end
