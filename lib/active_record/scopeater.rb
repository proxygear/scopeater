module ActiveRecord
  class Scopeater < ::Scopeater::Base
    new_hunter_behaviour

    def initialize object
      object = object.scoped unless object.kind_of? ::ActiveRecord::Relation
      super object, ::ActiveRecord::Relation
    end
    
    def self.taste_of object
      if object.kind_of? ::ActiveRecord::Relation
        ::ActiveRecord::Relation
      else
        nil
      end
    end
  end
end