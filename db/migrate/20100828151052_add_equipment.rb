class AddEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.integer :department_id
      t.integer :equipment_name_id

      t.string  :code
      t.string  :vehicle_registration
      t.boolean :status
      t.text    :remark

      t.timestamps
    end

    create_table :sizes do |t|
      t.string :name
      t.string :description
    end

    create_table :equipment_names do |t|
      t.integer :size_id
      t.integer :weight_limit_id
      t.string :name
      t.string :name_th
      t.text   :specification
      
      t.boolean :electric
      t.boolean :light
      t.boolean :demolish
      t.boolean :move_mat
      t.boolean :repair_route
      t.boolean :site_clear
      t.boolean :move_vehicle
      t.boolean :track_line

      t.timestamps
    end

    create_table :weight_limits do |t|
      t.string :name
      t.string :description
    end
  end

  def self.down
    drop_table "equipment"
  end
end


