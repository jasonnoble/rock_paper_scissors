#! /usr/bin/env ruby
Dir['lib/contestants/*.rb'].each {|fh| require fh}
require 'lib/throws'
require 'lib/core_extensions'
include Contestants

# This is an implementation of the classic Rock Paper Scissors game.
# The basic rules of the game are the following:
#    Rock beats Scissors
#    Scissors beats Paper
#    Paper beats Rock
#
#  Write your own implementation of a contestant to see if you can beat
#  the other players.
#
#  To get started:
#     irb -rlib/tournament.rb
#     >> @t = Tournament.new
#     >> @t.run
#
class Tournament
  attr_reader :players, :matches
  
  # Setup a tournament with a randomly ordered list of 
  # available contestants
  def initialize(players=Tournament.quick_pick)
    @players = players
    load_matches
    @verbose = false
    @judge_n_times = 100
  end
  
  # Return one each of all of the contestants that are auto-loaded from the
  # lib/contestants directory.
  def Tournament::quick_pick
    Contestants.constants.reject{|c| c.eql?("Sample")}.map{|c| eval "Contestants::#{c}" }
  end
  
  # Number of times each round should be played
  # The larger the number, the longer it will take to find a winner of a tournament
  # Default is 100 times/round
  def judge_n_times=(judge_n_times=100)
    @judge_n_times = judge_n_times
  end
    
  # Randomize the players and reload the matches
  def reset
    @players = @players.sort_by{rand}
    load_matches
    @matches
  end
  
  # Setter function for changing the debug messages
  # Usage:
  #   @t = Tournament.new
  #   @t.verbose = true
  def verbose=(verbose=false)
    # If they didn't pass us a true value, set it to false
    verbose = false unless verbose == true
    @verbose = verbose
    printf("Verbose messages turned %s\n", @verbose ? "On" : "Off")
    @verbose
  end
  
  # Whether or not the Tournament program should print out debug messages
  # Default is No
  def verbose?
    @verbose
  end
  
  # Execute a tournament.  It will run through all the matches until a
  # final winner has been determined
  def run
    raise "Tournament requires 2 or more players" if @players.size < 2
    
    winner = find_winner(*@matches)
    puts "#{winner.class} wins the tournament"
    winner
  end
  
  protected
  # Runs through the @matches and plays them each until a final winner
  # is found
  def find_winner(players)
    puts "PLAYERS: " + players.inspect if self.verbose?
    return players unless players.is_a?(Array)
    players[0] = find_winner(players[0]) if players[0].is_a?(Array)
    players[1] = find_winner(players[1]) if players[1].is_a?(Array)  
    return judge(players)
  end
  
  # Given two players, it plays the two players against each other
  # for a given number of rounds.  Whoever wins the most is returned
  # as the winner.
  def judge(players)
    players = players.compact
    if players.size < 2
      puts "#{players.first} has a bye!" if self.verbose?
      return players.first
    end
    
    if players.size > 2
      raise ArgumentError, "Must judge a contest between 2 or less players"
    end
    
    # If we were passed a class, instantiate that class
    players[0] = players[0].new if players[0].is_a?(Class)
    players[1] = players[1].new if players[1].is_a?(Class)
    
    wins = Hash.new(0)
    winner = nil
    players[0].reset if players[0].respond_to?('reset')
    players[1].reset if players[1].respond_to?('reset')
    @judge_n_times.times do
      play0 = players[0].play(winner)
      play1 = players[1].play(winner)
      winner = case play0.beats?(play1)
      when -1: players[1]
      when 1: players[0]
      when 0: "tie"
      end
      puts "#{play0} vs #{play1} = #{winner}\n\n" if self.verbose?
      wins[winner] += 1
    end
    if self.verbose?
      puts "Wins Percentages:"
      wins.keys.sort{|a, b| wins[a] <=> wins[b]}.each {|key|
        puts "\t#{key}\t#{sprintf("%.2f", (wins[key].to_f/@judge_n_times)*100)}"
      }
    end
    wins.delete('tie')
    
    winner = wins.keys.max{|a,b| wins[a] <=> wins[b]} || nil
    printf("*** %45s vs %-45s ***     ", players[0].class, players[1].class)
    puts "Winner: #{winner.class} (#{sprintf("%.2f", (wins[winner].to_f/@judge_n_times)*100)}%)"
    winner
  end
  
  # Returns an array with the number of players + the number
  # of byes.  There may be 0 or 1 byes.
  def seed
    @players + Array.new(nbyes, nil)
  end
  
  # Returns the number of players in the Tournament
  def nplayers; @players.size; end
  
  # Returns the number of rounds required for the game
  def nrounds; Math.log2(nplayers).ceil; end
  
  # Returns the number of byes in a Tournament.  Should
  # be 0 or 1.
  def nbyes; (1 << nrounds) - nplayers; end
  
  # Reset the matches to get a different play order
  def load_matches
    @matches = (0...nrounds).inject(seed) do |memo,_|
      memo.top_half.zip(memo.bottom_half.reverse)
    end
  end
end