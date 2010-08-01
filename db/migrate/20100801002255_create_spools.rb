class CreateSpools < ActiveRecord::Migration
  def self.up
    create_table :spools do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :spools
  end
end
