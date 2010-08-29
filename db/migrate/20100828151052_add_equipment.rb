class AddEquipment < ActiveRecord::Migration
  def self.up
    create_table "equipment" do |t|
      t.column "position_id", :integer
      t.column "code", :string
      t.column "status", :text
    end
  end

  def self.down
    drop_table "equipment"
  end
end
