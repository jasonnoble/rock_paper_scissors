module Contestants
  # This contestant throws Rock then Paper then Scissors
  # continuously in that order.
  class OrderedThrower
    def initialize
      @plays = [Rock, Paper, Scissors]
      @counter = 0
    end

    def play(last_winner = nil)
      play = @plays[@counter]
      @counter = @counter == 2 ? 0 : @counter + 1
      play
    end
  end
end
