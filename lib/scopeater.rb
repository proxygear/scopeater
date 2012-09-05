require "scopeater/version"
require "scopeater/behaviour"
require "scopeater/base"

[:mongoid, :mongo_mapper, :active_record].each do |orm|
  require "#{orm}/scopeater"
end

require "mongoid/scopeatable"

module Scopeater
  # packing shortcut
  def self.base object, taste=nil
    Base.eat object, taste
  end
end