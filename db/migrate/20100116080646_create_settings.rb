class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :name, :limit => 32, :null => false, :default => ""
      t.text :value
      t.text :default_value
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
