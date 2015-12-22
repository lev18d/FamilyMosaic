class AddCurrentCityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :currentcity, :string
  end
end
