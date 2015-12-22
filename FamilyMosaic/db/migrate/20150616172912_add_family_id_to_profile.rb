class AddFamilyIdToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :family_id, :integer
  end
end
