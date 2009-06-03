module Contestants
  # This contestant is a sample contestant
  class Sample
    def initialize
      raise "Sample is not a valid contestant"
    end

    # Play function is what's called by the Tournament class
    # to ask for what this contestant wants to play
    #
    # Arguments:
    #    last_winner       Whether or not the last play resulted
    #                      in this contestant winning.  The winner
    #                      is sent back (compare to self) or in the
    #                      case of a tie, the string "tie" will be sent.
    #  
    # Returns:
    #    A class of Paper, Rock, Scissors
    def play(last_winner = nil)
      Scissors
    end
    
    # This optional function allows the Tournament to reset
    # the Contestant's assumption.  The Tournament judge will
    # call this function once per round, so each time you are
    # played against a new opponent, you should reset your 
    # assumptions in this function.
    def reset
    end
  end
end