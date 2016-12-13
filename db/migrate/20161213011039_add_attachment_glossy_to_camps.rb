class AddAttachmentGlossyToCamps < ActiveRecord::Migration
  def self.up
    change_table :camps do |t|
      t.attachment :glossy
    end
  end

  def self.down
    remove_attachment :camps, :glossy
  end
end
