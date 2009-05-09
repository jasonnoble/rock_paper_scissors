class RemembersThrower
  def initialize
    @play = ''
    # Win Hash key = # times it won
    @wins = Hash.new(0)
    # Lose Hash key = # times it lost
    @losses = Hash.new(0)
    @first_play = true
    @plays = [Rock, Paper, Scissors]
  end

  def play(last_winner = nil)
    puts "RT played with #{last_winner}, #{@first_play}"
    unless @first_play
      if last_winner
        @wins[@play] += 1
      else
        @losses[@play] += 1 unless @play.nil?
        @plays.delete(@play) unless @play.nil?
      end
    else
      @first_play = false
    end
    
    puts "Plays\tWins\tLosses:"
    keys = @wins.keys | @losses.keys
    keys.sort{|a, b| @wins[a] <=> @wins[b]}.each {|key|
      print "#{key}\t#{sprintf("%.2f", @wins[key].to_f/100)}"
      puts "\t#{sprintf("%.2f", @losses[key].to_f/100)}"
    }
    
    # What should we play next?
    won_most = @wins.keys.max{|a, b| @wins[a] <=> @wins[b]}
    lost_most = @losses.keys.max{|a, b| @losses[a] <=> @losses[b]}
    
    if won_most.nil?
      @play = @plays[rand(@plays.size - 1)]
    elsif(won_most == lost_most)
      @play = Rock
    else
      @play = won_most || Rock
    end
    @play
  end
end

# if last_winner.nil? && @counter > 0
#       @opponent[@counter - 1] = @plays[@counter - 1]
#     elsif last_winner
#       # We were a winner with our last throw
#       @opponent[@counter - 1] = case @plays[@counter - 1]
#       when: Rock: Paper
#       when: Paper: Scissors
#       when: Scissors: Rock
#       end
#     else
#       # We were a loser with our last throw
#       @opponent[@counter - 1] = case @plays[@counter - 1]
#       when: Rock: Scissors
#       when: Paper: Rock
#       when: Scissors: Paper
#       end
#     end

