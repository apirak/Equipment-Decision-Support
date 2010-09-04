class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title
      t.string :name
      t.text   :description
      t.string :icon
      t.string :type
      t.decimal  :lat, :precision => 15, :scale => 10
      t.decimal  :lng, :precision => 15, :scale => 10
      t.text   :remark

      # Department
      t.integer :department_group_id
      t.string :department_class
      t.string :synonym
      t.text :location
      t.string :phone

      # Site
      t.integer :space_id
      t.integer :ground_strength_id
      t.integer :dissaster_id
      t.boolean :rain
      t.boolean :night_time
      t.boolean :wind_hard
      t.boolean :power_source

      t.boolean :electric
      t.boolean :light
      t.boolean :lift_more_20_ton
      t.boolean :lift_limit_20_ton
      t.boolean :lift_limit_5_ton
      t.boolean :Demolish
      t.boolean :Move_mat
      t.boolean :repair_route
      t.boolean :site_clear

      t.timestamps
    end

    create_table :spaces do |t|
      t.string :name
      t.string :description
    end

    create_table :ground_strengths do |t|
      t.string :name
      t.string :description
    end

    create_table :department_groups do |t|
      t.string :ability
      t.string :description
    end

    create_table :staffs do |t|
      t.integer :department_id
      t.string  :code
      t.string  :firstname
      t.string  :surname
      t.string  :nickname
      t.string  :email
      t.string  :password
      t.string  :phone
      t.string  :post
      t.string  :ability
      t.boolean :status
      t.text    :remark
      
      t.timestamps
    end
    
    create_table :dissasters do |t|
      t.string :name
      t.string :description
    end
  end

  def self.down
    drop_table :positions
    drop_table :spaces
    drop_table :ground_strengths
    drop_table :department_groups
    drop_table :staffs
    drop_table :dissasters
  end
end
