require File.dirname(__FILE__) + '/../spec_helper'

describe ScissorsThrower do
  it "should create an instance" do
    s = ScissorsThrower.new
    s.class.should be(ScissorsThrower)
  end
  
  it "should throw scissors" do
    s = ScissorsThrower.new
    s.play.should == Scissors
  end
  
  it "should throw scissors 100 times in a row" do
    s = ScissorsThrower.new
    100.times do
      s.play.should == Scissors
    end
  end
end
