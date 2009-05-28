require File.dirname(__FILE__) + '/../spec_helper'

describe Jason do
  it "should create an instance" do
    j = Jason.new
    j.class.should be(Jason)
  end
  
  it "should throw Paper first" do
    j = Jason.new
    j.play.should == Paper
  end
  
  it "should throw Rock after throwing Paper" do
    j = Jason.new
    j.play.should == Paper
    j.play.should == Rock
  end
  
  it "should throw Rock on the third play" do
    j = Jason.new
    j.play.should == Paper
    j.play.should == Rock
    j.play.should == Rock
  end
  
  it "should throw Paper on the fourth play" do
    j = Jason.new
    j.play.should == Paper
    j.play.should == Rock
    j.play.should == Rock
    j.play.should == Paper
  end
  
  it "should throw Paper on the 100th play" do
    j = Jason.new
    99.times do
      j.play
    end
    j.play.should == Paper
  end
end
