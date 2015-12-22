class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.string :r_type
    end
  end
end
