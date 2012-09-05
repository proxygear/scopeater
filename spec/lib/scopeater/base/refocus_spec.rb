require 'spec_helper'

describe Scopeater::Base do
  let(:eater_class) { Scopeater::Base }
  let(:object) { "a string" }
  let(:eater) { eater_class.new object }

  describe 'refocus' do
    context 'on another taste' do
      let(:refocus) { eater.refocus_on Integer }

      it 'returns a eater' do
        refocus.should be_a(eater_class)
      end

      it 'returns a new eater' do
        refocus.should_not == eater
      end

      it "didn't changed eater taste" do
        eater.taste.should == object.class
      end
    end

    context 'on same taste' do
      let(:refocus) { eater.refocus_on eater.taste }

      it 'returns same eater' do
        refocus.should == refocus
      end
    end
  end
end