class AddSpoolToBigups < ActiveRecord::Migration
  def self.up
    add_column :bigups, :spool_id, :integer
  end

  def self.down
    remove_column :bigups, :spool_id
  end
end
