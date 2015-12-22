class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :description
      t.string :file
      t.integer :post_id
      t.date :date
      t.timestamps
    end
  end
end
