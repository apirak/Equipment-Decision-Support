class Dissaster < ActiveRecord::Base
  has_many :sites

  def self.build(name, description)
    dissaster = Dissaster.find_by_name(name)
    unless dissaster
      dissaster = Dissaster.new()
    end
    dissaster.name = name
    dissaster.description = description

    if dissaster.save
      return "Save dissaster #{dissaster.name}"
    else
      return "Can't save dissaster #{dissaster.name}"
    end
  end
end