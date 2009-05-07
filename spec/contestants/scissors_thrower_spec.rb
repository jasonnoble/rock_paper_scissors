require File.dirname(__FILE__) + '/../spec_helper'
require 'contestants/scissors_thrower'

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
    100.times do
      s = ScissorsThrower.new
      s.play.should == Scissors
    end
  end
end
