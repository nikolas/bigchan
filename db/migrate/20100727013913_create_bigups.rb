class CreateBigups < ActiveRecord::Migration
  def self.up
    create_table :bigups do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :bigups
  end
end
