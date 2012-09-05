require 'mongoid_spec_helper'

describe Mongoid::Scopeater do
  MONGOID_SPEC_CASES.each do |target, object|
    describe target do
      let(:eater) { Mongoid::Scopeater.new object }
    
      it 'has MongoidModel taste' do
        eater.taste.should == MongoidModel
      end
      
      it 'return it-self when scoping' do
        eater.asc(:created_at).should == eater
      end
      
      it 'return instance when finding' do
        eater.first.should.class == MongoidModel
      end
    end
  end
end