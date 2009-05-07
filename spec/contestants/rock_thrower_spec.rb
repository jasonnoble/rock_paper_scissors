require File.dirname(__FILE__) + '/../spec_helper'
require 'contestants/rock_thrower'

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
    100.times do
      s = RockThrower.new
      s.play.should == Rock
    end
  end
end