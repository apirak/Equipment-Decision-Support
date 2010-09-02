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
      t.boolean :rain
      t.boolean :night_time
      t.boolean :wind_hard
      t.boolean :power_source

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
    end
  end

  def self.down
    drop_table :positions
    drop_table :spaces
    drop_table :ground_strengths
    drop_table :department_groups
    drop_table :staffs
  end
end
