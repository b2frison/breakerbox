class AddAttachmentPhotoToBreakers < ActiveRecord::Migration
  def self.up
    change_table :breakers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :breakers, :photo
  end
end
