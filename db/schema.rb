# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100829151820) do

  create_table "department_groups", :force => true do |t|
    t.string "ability"
    t.string "description"
  end

  create_table "dissasters", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "equipment", :force => true do |t|
    t.integer  "department_id"
    t.integer  "equipment_name_id"
    t.string   "code"
    t.string   "vehicle_registration"
    t.boolean  "status"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment_name_sites", :force => true do |t|
    t.integer "equipment_name_id"
    t.integer "position_id"
    t.integer "equipment_id"
    t.integer "score"
    t.string  "remark"
  end

  create_table "equipment_names", :force => true do |t|
    t.integer  "size_id"
    t.integer  "weight_limit_id"
    t.integer  "equipment_name_id"
    t.string   "name"
    t.string   "name_th"
    t.text     "specification"
    t.boolean  "electric"
    t.boolean  "light"
    t.boolean  "demolish"
    t.boolean  "move_mat"
    t.boolean  "repair_route"
    t.boolean  "site_clear"
    t.boolean  "move_vehicle"
    t.boolean  "track_line"
    t.boolean  "need_truck"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ground_strengths", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "job_descriptions", :force => true do |t|
    t.integer "equipment_id"
    t.integer "staff_id"
    t.string  "name"
    t.text    "description"
  end

  create_table "logs", :force => true do |t|
    t.integer  "creater"
    t.integer  "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "netzke_field_lists", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.string   "model_name"
    t.integer  "user_id"
    t.integer  "role_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "netzke_preferences", :force => true do |t|
    t.string   "name"
    t.string   "pref_type"
    t.text     "value"
    t.integer  "user_id"
    t.integer  "role_id"
    t.string   "widget_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.string   "type"
    t.decimal  "lat",                 :precision => 15, :scale => 10
    t.decimal  "lng",                 :precision => 15, :scale => 10
    t.text     "remark"
    t.text     "location"
    t.integer  "department_group_id"
    t.string   "department_class"
    t.string   "synonym"
    t.string   "phone"
    t.integer  "size_id"
    t.integer  "ground_strength_id"
    t.integer  "weight_limit_id"
    t.integer  "dissaster_id"
    t.boolean  "rain"
    t.boolean  "night_time"
    t.boolean  "wind_hard"
    t.boolean  "power_source"
    t.boolean  "electric"
    t.boolean  "light"
    t.boolean  "demolish"
    t.boolean  "move_mat"
    t.boolean  "repair_route"
    t.boolean  "site_clear"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "name",          :limit => 32, :default => "", :null => false
    t.text     "value"
    t.text     "default_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "staffs", :force => true do |t|
    t.integer  "department_id"
    t.string   "code"
    t.string   "firstname"
    t.string   "surname"
    t.string   "nickname"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "post"
    t.string   "ability"
    t.boolean  "status"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weight_limits", :force => true do |t|
    t.string "name"
    t.string "description"
  end

end
