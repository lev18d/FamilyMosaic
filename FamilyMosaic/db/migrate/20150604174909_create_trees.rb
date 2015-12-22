class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
    	t.integer :profile1_id
    	t.integer :profile2_id
    	t.references :relationship
      t.timestamps
    end
  end
end
