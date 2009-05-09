require File.dirname(__FILE__) + '/../spec_helper'

describe OrderedThrower do
  it "should create an instance" do
    s = OrderedThrower.new
    s.class.should be(OrderedThrower)
  end
  
  # Throw Rock, then Paper, then Scissors
  describe "should throw in order" do
    s = OrderedThrower.new
    
    it "should throw rock first" do
      s.play.should == Rock
    end
    
    it "should throw Paper second" do
      s.play.should == Paper
    end
    
    it "should throw Scissors third" do
      s.play.should == Scissors
    end
    
    it "should throw Rock fourth" do
      s.play.should == Rock
    end
  
    it "should throw Rock on the 100th throw" do
      s = OrderedThrower.new
      1.upto(100) do |number|
        play = s.play
        play.should == Rock if number == 100
      end
    end
  end
end
