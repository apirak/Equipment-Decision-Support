class Space < ActiveRecord::Base
  has_many :sites

  def self.build(name, description)
    space = Space.find_by_name(name)
    unless space
      space = Space.new()
    end
    space.name = name
    space.description = description

    if space.save
      return "Save space #{name}"
    else
      return "Can't save space #{name}"
    end
  end
end