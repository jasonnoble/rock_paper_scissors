require 'test/unit'
require '../test_helper'

class TournamentTest < Test::Unit::TestCase
  def test_rock_against_scissors
    prs_tournament = Tournament.new(PRSStrategy)
    assert prs_tournament.run(RockThrower, ScissorsThrower) == RockThrower
  end
  
  def test_larger_tournament
    prs_tournament = Tournament.new(PRSStrategy)
    assert prs_tournament.run(RockThrower, ScissorsThrower, PaperThrower) == RockThrower

  end
end