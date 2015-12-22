class AddReferenceToDescriptions < ActiveRecord::Migration
  def change
  	add_reference :descriptions, :profile
  	add_reference :descriptions, :tree
  end
end
