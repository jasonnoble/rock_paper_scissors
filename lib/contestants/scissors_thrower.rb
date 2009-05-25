module Contestants
  # This contestant throws Scissors every time.
  class ScissorsThrower
    def initialize
    end

    def play(last_winner = nil)
      Scissors
    end
  end
end