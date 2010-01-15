class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title
      t.text   :description
      t.string :icon
      t.string :type
      t.decimal  :lat, :precision => 15, :scale => 10
      t.decimal  :lng, :precision => 15, :scale => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
