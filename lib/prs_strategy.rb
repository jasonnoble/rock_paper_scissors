class PRSStrategy
  # Winner after 100 trials
  def self.call(players)
    sum = 0
    100.times do
      winner = find_winner(players)
      sum += 1 if players.first == winner
    end
    winner = sum > 50 ? players.first : players.last
    winner_sum = sum > 50 ? sum : 100 - sum
    puts "#{winner} won #{winner_sum}% of the time"
    winner
  end
  
  # Winner of single trial
  def self.find_winner(players)
    player1, player2 = players
    
    player1_result = player1.result
    player2_result = player2.result
    
    # Handle tie
    if player1_result == player2_result
      return players[rand(players.size)]
    end
    
    if player1_result == :rock
      return player1 if player2_result == :scissors
      return player2 if player2_result == :paper
    end
    
    if player1_result == :paper
      return player1 if player2_result == :rock
      return player2 if player2_result == :scissors
    end
    
    if player1_result == :scissors
      return player1 if player2_result == :paper
      return player2 if player2_result == :rock
    end
  end
end
