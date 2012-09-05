require 'spec_helper'

describe Scopeater::Base do
  let(:eater_class) { Scopeater::Base }
  let(:object) { "a string" }
  let(:eater) { eater_class.new object }

  it 'uses object class as taste by convention' do
    eater.taste.should == object.class
  end

  it 'contains given object' do
    eater.content.should == object
  end

  it 'likes same object class' do
    eater.like?("another string").should == true
  end

  it 'dislikes different object class' do
    eater.like?(666).should == false
  end

  describe 'method call returning matching taste' do
    let(:call_result) { eater.capitalize }
    before(:each) { call_result }

    it 'returns eater' do
      call_result.should be_a(eater_class)
    end

    it 'replaced eater content by new one' do
      call_result.content.should == object.capitalize
    end
  end

  describe 'method call returning unmatching taste' do
    let(:call_result) { eater.split(' ') }
    before(:each) { call_result }

    it 'returns content' do
      call_result.should == object.split(' ')
    end

    it "didn't change eater content" do
      eater.content.should == object
    end
  end

  context 'for specific taste' do
    let(:taste) { Float }
    let(:eater) { eater_class.new object, taste }

    it 'keeps this taste' do
      eater.taste.should == taste
    end
  end
end