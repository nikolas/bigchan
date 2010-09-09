class AddAttachmentsPicToBigup < ActiveRecord::Migration
  def self.up
    add_column :bigups, :pic_file_name, :string
    add_column :bigups, :pic_content_type, :string
    add_column :bigups, :pic_file_size, :integer
    add_column :bigups, :pic_updated_at, :datetime
  end

  def self.down
    remove_column :bigups, :pic_file_name
    remove_column :bigups, :pic_content_type
    remove_column :bigups, :pic_file_size
    remove_column :bigups, :pic_updated_at
  end
end
