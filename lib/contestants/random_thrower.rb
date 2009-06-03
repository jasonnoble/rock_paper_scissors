module Contestants
  # This contestant will throw a random Rock, Paper or Scissors every
  # time
  class RandomThrower
    def initialize
    end

    def play(last_winner = nil)
      random = Kernel.rand
      return Rock if random < 0.33
      return Paper if random >= 0.33 && random < 0.66
      return Scissors 
    end
  end
end
