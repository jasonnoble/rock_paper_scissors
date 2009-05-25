module Contestants
  # This contestant throws Paper every time.
  class PaperThrower
    def initialize
    end

    def play(last_winner = nil)
      Paper
    end
  end
end