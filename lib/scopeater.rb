require "scopeater/version"
require "scopeater/behaviour"
require "scopeater/base"

[:mongoid, :mongo_mapper, :active_record].each do |orm|
  require "#{orm}/scopeater"
end

require "mongoid/scopeatable"

module Scopeater
  SUPPORTED_ORMS = {
    mongoid: 'Mongoid',
    active_record: 'ActiveRecord',
    mongo_mapper: 'MongoMapper'
  }
  # packing shortcut
  def self.base object, taste=nil
    Base.eat object, taste
  end
  
  def self.orm
    @orm
  end
  
  def self.orm= orm
    puts "Scopeater for #{orm} ORM is not officially supported" unless SUPPORTED_ORMS.include?(orm)
    @orm = Kernel.const_get orm.to_s.camelize
  end
end