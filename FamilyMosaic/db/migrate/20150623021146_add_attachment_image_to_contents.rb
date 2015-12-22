class AddAttachmentImageToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :contents, :file
  end
end
