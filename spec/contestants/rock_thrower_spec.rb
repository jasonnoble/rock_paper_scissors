require File.dirname(__FILE__) + '/../spec_helper'

describe RockThrower do
  it "should create an instance" do
    s = RockThrower.new
    s.class.should be(RockThrower)
  end
  
  it "should throw rock" do
    s = RockThrower.new
    s.play.should == Rock
  end
  
  it "should throw rock 100 times in a row" do
    s = RockThrower.new
    100.times do
      s.play.should == Rock
    end
  end
end