require 'mongoid_spec_helper'

describe Mongoid do
  MONGOID_SPEC_CASES.each do |target_case, object|
    describe target_case do
      let(:target) { object }

      it "responds to eater" do
        target.should respond_to(:eater)
      end
    
      describe 'eater' do
        let(:eater) { target.eater }

        it 'is a Mongoid::Scopeater' do
          eater.should be_a(Mongoid::Scopeater)
        end
      
        it 'has MongoidModel taste' do
          eater.taste.should == MongoidModel
        end
      end
    end
  end
end