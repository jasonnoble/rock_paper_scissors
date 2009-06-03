require File.dirname(__FILE__) + '/spec_helper'

describe Tournament do
  describe "quick_pick" do
    before(:all) do
      @a = Tournament.quick_pick
    end
    
    it "should include Rock, Paper, Scissors" do
      
      @a.include?(Contestants::RockThrower).should be_true
      @a.include?(Contestants::PaperThrower).should be_true
      @a.include?(Contestants::ScissorsThrower).should be_true
    end
    
    it "should not include Sample" do
      @a.include?(Contestants::Sample).should be_false
    end
  end
  
  describe "should have verbosity" do
    it "that is initially turned off" do
      @t = Tournament.new([RockThrower])
      @t.verbose?.should be_false
    end
    
    it "should be toggable" do
      @t = Tournament.new([RockThrower])
      @t.verbose = true
      @t.verbose?.should be_true
      
      @t.verbose = false
      @t.verbose?.should be_false
      
      @t.verbose = "blah"
      @t.verbose?.should be_false
    end
  end
  
  it "raises an error with < 2 players" do
    @t = Tournament.new([RockThrower])
    lambda{@t.run}.should raise_error("Tournament requires 2 or more players")
  end

  it "does not raise an error with 2 or more players" do
    @t = Tournament.new([RockThrower, PaperThrower])
    lambda{@t.run}.should_not raise_error("Tournament requires 2 or more players")
  end

  describe "with two contestants (Rock and Paper)," do
    before(:each) do
      @t = Tournament.new([RockThrower, PaperThrower])
    end

    it "Paper should win" do
      @t.run.class.should == PaperThrower
    end
  end
  
  describe "with two contestants (Paper and Paper)," do
    it "it should be a tie" do
      p1 = PaperThrower.new
      p2 = PaperThrower.new
      @t = Tournament.new([p1, p2])
      @t.run.class.should == NilClass
    end
  end

  describe "with three contestants (Rock, Paper, Scissors)," do
    it "Rock should win" do
      @t = Tournament.new([RockThrower,PaperThrower,ScissorsThrower])
      @t.run.class.should == RockThrower
    end

    it "Scissors should win" do
      @t = Tournament.new([ScissorsThrower,RockThrower,PaperThrower])
      @t.run.class.should == ScissorsThrower
    end
  end
  
  describe "with 10 contestants" do
    it "should result in a tie" do
      @t = Tournament.new([RockThrower,PaperThrower,ScissorsThrower,
                           RockThrower,PaperThrower,ScissorsThrower,
                           RockThrower,PaperThrower,ScissorsThrower,
                           RockThrower])
      @t.run.class.should == NilClass
    end
  end
end
