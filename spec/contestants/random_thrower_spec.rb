require File.dirname(__FILE__) + '/../spec_helper'

describe RandomThrower do
  it "should create an instance" do
    s = RandomThrower.new
    s.class.should be(RandomThrower)
  end
  
  # it "should throw paper" do
  #     s = RandomThrower.new
  #     s.play.should == :paper
  #   end
  
  it "should throw paper 100 times in a row" do
    Kernel.should_receive(:rand).exactly(100).times.and_return(0.2)
    100.times do
      s = RandomThrower.new
      s.play.should == Rock
    end
  end
  
  it "should throw randomly" do
    s = RandomThrower.new
    plays = Hash.new(0)
    10000.times do
      plays[s.play] += 1
    end
    sum = plays.values.inject(0) {|sum,value| sum += value}.to_f
    (plays[Scissors]/sum).should be_close(0.33, 0.03)
    (plays[Rock]/sum).should be_close(0.33, 0.03)
    (plays[Paper]/sum).should be_close(0.33, 0.03)
  end
end
