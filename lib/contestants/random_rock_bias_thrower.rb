module Contestants
  # This contestant will throw a random Rock, Paper or Scissors every
  # time, however it will throw Rock more often than Paper or Scissors.
  class RandomRockBiasThrower
    def initialize
    end

    def play(last_winner = nil)
      random = Kernel.rand
      return Rock if random < 0.50
      return Paper if random >= 0.50 && random < 0.75
      return Scissors 
    end
  end
end
