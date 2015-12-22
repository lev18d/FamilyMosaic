class AddProfileRefToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :profile
  end
end
