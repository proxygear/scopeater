module Mongoid
  class Scopeater < ::Scopeater::Base
    new_hunter_behaviour

    def initialize object
      super object
      if object.kind_of? ::Mongoid::Criteria
        self.taste = object.klass
      else
        self.taste = object
      end
    end
    
    def self.taste_of object
      if object.kind_of? ::Mongoid::Criteria
        object.klass
      else
        nil
      end
    end
  end
end