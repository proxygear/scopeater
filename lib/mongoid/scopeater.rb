module Mongoid
  class Scopeater < ::Scopeater::Base
    new_hunter_behaviour

    def initialize object
      super object
    end
    
    def self.taste_of object
      if object.kind_of? ::Mongoid::Criteria
        object.klass
      else
        object
      end
    end
  end
end