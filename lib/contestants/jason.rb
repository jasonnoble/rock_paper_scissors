module Contestants
  # This contestant throws Scissors every time.
  class Jason
    def initialize
      @plays = Array.new
    end

    def play(last_winner = nil)
      if @plays.empty?
        @plays << Paper
      else
        @plays << Rock
      end
      if @plays.size > 3
        @plays = [@plays[0]]
      end
      @plays.last
    end
  end
end