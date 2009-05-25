module Contestants
  # This contestant throws Rock every time.
  class RockThrower
    def initialize
    end

    def play(last_winner = nil)
      Rock
    end
  end
end