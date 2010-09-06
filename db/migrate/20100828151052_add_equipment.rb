class AddEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.integer :department_id
      t.integer :equipment_name_id
      t.integer :size_id
      t.integer :weight_limit_id
      
      t.string  :code
      t.string  :vihicle_registration
      t.boolean :status
      t.text    :specification
      t.text    :remark

      t.boolean :electric
      t.boolean :light
      t.boolean :demolish
      t.boolean :move_mat
      t.boolean :repair_route
      t.boolean :site_clear
      t.boolean :move_vehecle
      t.boolean :track_line

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

    create_table :weight_limits do |t|
      t.string :name
      t.string :description
    end
  end

  def self.down
    drop_table "equipment"
  end
end
