ActiveRecord::Schema.define(:version => 0) do
  create_table :students, :force => true do |t|
    t.string :name
    t.string :last_name
    t.datetime :description
  end
end