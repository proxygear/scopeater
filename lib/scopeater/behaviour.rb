module Scopeater
  module Behaviour
    def self.included base
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def retain object, taste=nil
        if object.kind_of? self
          object.refocus_on taste
        else
          new object, taste
        end
      end

      def taste_of object
        object.class
      end
      
      def new_hunter_behaviour
        self.send :include, ::Scopeater::Behaviour
      end
    end
  end
end