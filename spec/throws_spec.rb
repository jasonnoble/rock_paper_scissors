require File.dirname(__FILE__) + '/spec_helper'

describe Scissors do
  it "should beat paper" do
    Scissors.beats?(Paper).should == 1
  end
  
  it "should not beat rock" do
    Scissors.beats?(Rock).should == -1
  end

  it "should not beat scissors" do
    Scissors.beats?(Scissors).should == 0
  end
end

describe Rock do
  it "should not beat paper" do
    Rock.beats?(Paper).should == -1
  end
  
  it "should not beat rock" do
    Rock.beats?(Rock).should == 0
  end

  it "should beat scissors" do
    Rock.beats?(Scissors).should == 1
  end
end

describe Paper do
  it "should not beat paper" do
    Paper.beats?(Paper).should == 0
  end
  
  it "should beat rock" do
    Paper.beats?(Rock).should == 1
  end

  it "should not beat scissors" do
    Paper.beats?(Scissors).should == -1
  end
end