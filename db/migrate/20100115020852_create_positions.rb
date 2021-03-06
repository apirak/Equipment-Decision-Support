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
      t.text :location

      # Department
      t.integer :department_group_id
      t.integer :department_job_id
      t.string :department_class
      t.string :synonym
      t.string :phone

      # Site
      t.integer :size_id
      t.integer :ground_strength_id
      t.integer :weight_limit_id
      t.integer :dissaster_id
      t.boolean :rain
      t.boolean :night_time
      t.boolean :wind_hard
      t.boolean :power_source

      t.boolean :electric
      t.boolean :light
      t.boolean :demolish
      t.boolean :move_mat
      t.boolean :repair_route
      t.boolean :site_clear

      t.timestamps
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

    create_table :job_descriptions do |t|
      t.integer :equipment_id
      t.integer :staff_id
      t.string :name
      t.text :description
    end
    
    create_table :department_jobs do |t|
      t.string :name
      t.text :description
      t.string :icon
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
