class AddEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.integer :department_id
      t.integer :equipment_name_id
      t.integer :size_id
      t.boolean :powersource
      t.boolean :move_vehecle
      t.boolean :dig
      t.boolean :move_object
      t.boolean :develop
      t.boolean :surface
      t.boolean :iron_wheel
      t.string  :code
      t.string  :vehicle_registration
      t.boolean :status
      t.text    :specification
      t.text    :remark

      t.timestamps
    end

    create_table :sizes do |t|
      t.string :name
      t.string :description
    end

    create_table :equipment_names do |t|
      t.string :name
      t.string :description
    end
  end

  def self.down
    drop_table "equipment"
  end
end
