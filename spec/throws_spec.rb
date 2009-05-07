require File.dirname(__FILE__) + '/spec_helper'

describe Scissors do
  it "should beat paper" do
    Scissors.beats?(Paper).should be_true
  end
  
  it "should beat rock" do
    Scissors.beats?(Rock).should be_false
  end

  it "should beat scissors" do
    Scissors.beats?(Scissors).should be_false
  end
end

describe Rock do
  it "should beat paper" do
    Rock.beats?(Paper).should be_false
  end
  
  it "should beat rock" do
    Rock.beats?(Rock).should be_false
  end

  it "should beat scissors" do
    Rock.beats?(Scissors).should be_true
  end
end

describe Paper do
  it "should beat paper" do
    Paper.beats?(Paper).should be_false
  end
  
  it "should beat rock" do
    Paper.beats?(Rock).should be_true
  end

  it "should beat scissors" do
    Paper.beats?(Scissors).should be_false
  end
end