require File.dirname(__FILE__) + '/../spec_helper'

describe RemembersThrower do
  it "should create an instance" do
    s = RemembersThrower.new
    s.class.should be(RemembersThrower)
  end
  
  # Throw Rock, then Paper, then Scissors
  it "should start winning after four throws" do
    s = RemembersThrower.new
    # Assume play1 is Rock
    play1 = s.play
    
    # Rock lost, so play Scissors
    play2 = s.play(nil)
    play2.should_not == play1
    
    # Scissors and Rock lost, so play Paper
    play3 = s.play(nil)
    play3.should_not == play1
    play3.should_not == play2
    
    # Paper won, so play it again
    play4 = s.play(s)
    play4.should == play3
    
    # If paper lost this time, it should be
    # played again, as it's the only win you've
    # had
    play5 = s.play(nil)
    play5.should == play3    
  end
  
  it "should reset plays after three losses in a row" do
    s = RemembersThrower.new
    play1 = s.play
    play2 = s.play(nil)
    play3 = s.play(nil)
    play4 = s.play(nil)
    s.play(nil).should_not == nil
  end
end
