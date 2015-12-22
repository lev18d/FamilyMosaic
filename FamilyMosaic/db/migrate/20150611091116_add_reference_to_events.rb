class AddReferenceToEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :profile
  	add_reference :events, :tree
  end
end
