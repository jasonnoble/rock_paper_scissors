require File.dirname(__FILE__) + '/../spec_helper'

describe PaperThrower do
  it "should create an instance" do
    s = PaperThrower.new
    s.class.should be(PaperThrower)
  end
  
  it "should throw paper" do
    s = PaperThrower.new
    s.play.should == Paper
  end
  
  it "should throw paper 100 times in a row" do
    100.times do
      s = PaperThrower.new
      s.play.should == Paper
    end
  end
end
