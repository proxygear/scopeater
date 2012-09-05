require 'active_support'

module Mongoid
  module Document
    extend ::ActiveSupport::Concern
  end
  
  module EmbeddedDocument
    extend ::ActiveSupport::Concern
  end

  class Criteria
    def initialize *a
    end
    
    def first
      klass.new()
    end
    
    def klass
      MongoidModel
    end
    
    def asc *a
      self
    end
  end
end

require "mongoid/scopeatable"

class MongoidModel
  include ::Mongoid::Document

  def self.first
    new()
  end

  def self.asc *a
    Mongoid::Criteria.new
  end
end