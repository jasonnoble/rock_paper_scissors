require File.dirname(__FILE__) + '/spec_helper'

describe Tournament do
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
      @t = Tournament.new([PaperThrower, PaperThrower])
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
