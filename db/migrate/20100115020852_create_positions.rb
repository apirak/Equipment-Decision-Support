class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title
      t.text   :description
      t.string :icon
      t.string :type
      t.decimal  :lat, :precision => 15, :scale => 10
      t.decimal  :lng, :precision => 15, :scale => 10

      # Department
      t.string :department_class
      t.string :name
      t.string :synonym
      t.string :location
      t.string :phone
      t.text   :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
