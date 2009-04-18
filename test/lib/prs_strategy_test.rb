require 'test/unit'
require '../../lib/prs_strategy'

class PRSStrategyTest < Test::Unit::TestCase
  def test_rock_versus_paper
    assert PRSStrategy.call([RockThrower, PaperThrower]) == PaperThrower
    assert PRSStrategy.call([PaperThrower, RockThrower]) == PaperThrower
  end

  def test_rock_versus_scissors
    assert PRSStrategy.call([RockThrower, ScissorsThrower]) == RockThrower
    assert PRSStrategy.call([ScissorsThrower, RockThrower]) == RockThrower
  end

  def test_scissors_versus_paper
    assert PRSStrategy.call([PaperThrower, ScissorsThrower]) == ScissorsThrower
    assert PRSStrategy.call([ScissorsThrower, PaperThrower]) == ScissorsThrower
  end
  
  def test_paper_versus_paper
    puts PRSStrategy.call([PaperThrower, PaperThrower]) == nil
  end

end
