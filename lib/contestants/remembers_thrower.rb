module Contestants
  # This contestant remembers the moves thrown in the past and whether
  # those moves won or not.  It will throw the throw that has given it
  # the most wins in the past, in the hope that it can win again.
  class RemembersThrower
    def initialize
      @play = ''
      self.reset
      self.initial_plays
      @debug = true
    end
    
    def initial_plays
      puts "Resetting plays" if @debug
      @plays = [Rock, Paper, Scissors]
      @plays
    end
    
    def reset
      # Win Hash key = # times it won
      @wins = Hash.new(0)
      # Lose Hash key = # times it lost
      @losses = Hash.new(0)
      @first_play = true
    end

    def play(last_winner = nil)
      puts "RT #{last_winner ? "won" : "lost"} playing #{@play}" if @debug
      unless @first_play
        if last_winner.eql?(self)
          @wins[@play] += 1
        else
          @losses[@play] += 1 unless @play.nil?
          @plays.delete(@play) unless @play.nil?
        end
      else
        @first_play = false
      end

      puts "Plays\tWins\tLosses:" if @debug
      keys = @wins.keys | @losses.keys
      keys.sort{|a, b| @wins[a] <=> @wins[b]}.each {|key|
        print "#{key}\t#{sprintf("%.2f", @wins[key].to_f/100)}" if @debug
        puts "\t#{sprintf("%.2f", @losses[key].to_f/100)}" if @debug
      }

      # What should we play next?
      won_most = @wins.keys.max{|a, b| @wins[a] <=> @wins[b]}
      lost_most = @losses.keys.max{|a, b| @losses[a] <=> @losses[b]}

      self.initial_plays if @plays.empty?
      puts "#{self.inspect}" if @debug
      if won_most.nil?
        @play = @plays[rand(@plays.size - 1)]
      elsif(won_most == lost_most)
        @play = Rock
      else
        @play = won_most || Rock
      end
      puts "#{self.class} is playing #{@play}" if @debug
      @play
    end
  end
end
