class AddReferenceToProfiles < ActiveRecord::Migration
  def change
  	add_reference :profiles, :user
  end
end