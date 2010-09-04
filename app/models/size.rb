class Size < ActiveRecord::Base
  has_many :equipment

  def self.build(name, description)
    size = Size.find_by_name(name)
    unless size
      size = Size.new()
    end
    size.name = name
    size.description = description

    if size.save
      return "Save size #{size.name}"
    else
      return "Can't size space #{size.name}"
    end
  end
end