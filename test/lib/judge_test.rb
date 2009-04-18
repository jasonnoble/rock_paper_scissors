require 'test/unit'
class JudgeTest < Test::Unit::TestCase
  def base_strategy
    lambda{|players| players.first}
  end
  private :base_strategy

  def test_when_player_1_is_bye
    assert Judge.winner(base_strategy, [nil, :player2]) == :player2
  end

  def test_when_player_2_is_bye
    assert Judge.winner(base_strategy, [:player1 ,nil]) == :player1
  end

  def test_when_both_are_byes
    assert Judge.winner(base_strategy, [nil ,nil]) == nil
  end

  def test_when_more_than_2_players
    assert_raise ArgumentError do
      Judge.winner(base_strategy, [1,2,3])
    end
  end

  def test_without_strategy
    assert_no_raise ArgumentError do
      Judge.winner(nil, [1,2])
    end
  end

  def test_strategies
    player_1_wins = lambda{|players| players.first }
    assert Judge.winner(player_1_wins, [1,2]) == 1
  end
end
