module MongoMapper
  class Scopeater < Scopeater::Base
    new_hunter_behaviour
    
    def initialize object
      object = object.scoped unless object.kind_of? Plucky::Query
      super object, Plucky::Query
    end
    
    def self.taste_of object
      if object.kind_of? Plucky::Query
        Plucky::Query
      else
        nil
      end
    end
  end
end