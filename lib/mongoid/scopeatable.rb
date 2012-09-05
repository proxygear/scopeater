module Mongoid
  module Scopeatable
    extend ActiveSupport::Concern

    included do
      class_eval do
        if self == Mongoid::Criteria
          include EaterMethods
        else # we are in model class
          extend EaterMethods
        end
      end
    end

    module EaterMethods
      def eater
        Scopeater.new self
      end
    end
  end
end

Mongoid::Document.send :include, Mongoid::Scopeatable
Mongoid::Criteria.send :include, Mongoid::Scopeatable

