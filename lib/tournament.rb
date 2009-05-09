#! /usr/bin/env ruby
Dir['lib/contestants/*.rb'].each {|fh| require fh}
require 'lib/throws'

class << Math
  def log2(n); log(n) / log(2); end
end

class Array
  def half_size; size >> 1; end
  def top_half; self[0, half_size]; end
  def bottom_half; self[half_size, half_size]; end
end

class Tournament
  def initialize(players)
    @players = players
    @matches = (0...nrounds).inject(seed) do |memo,_|
      memo.top_half.zip(memo.bottom_half.reverse)
    end
  end
  
  attr_reader :players, :matches
  def run
    raise "Tournament requires 2 or more players" if @players.size < 2
    
    winner = find_winner(*@matches)
    puts "#{winner.inspect} wins the tournament"
    winner
  end
  
  def find_winner(players)
    puts "PLAYERS: " + players.inspect
    return players unless players.is_a?(Array)
    players[0] = find_winner(players[0]) if players[0].is_a?(Array)
    players[1] = find_winner(players[1]) if players[1].is_a?(Array)  
    return judge(players)
  end
  
  def judge(players)
    players = players.compact
    if players.size < 2
      puts "#{players.first} has a bye!"
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
    100.times do
      play0 = players[0].play(winner == players[0] ? true : false)
      play1 = players[1].play(winner == players[1] ? true : false)
      winner = case play0.beats?(play1)
      when -1: players[1]
      when 1: players[0]
      when 0: "tie"
      end
      puts "#{play0} vs #{play1} = #{winner}\n\n"
      
      wins[winner] += 1
    end
    puts "Wins Percentages:"
    wins.keys.sort{|a, b| wins[a] <=> wins[b]}.each {|key|
      puts "\t#{key}\t#{sprintf("%.2f", wins[key].to_f/100)}"
    }
    wins.delete('tie')
    # wins[Scissors] = 53; wins[Random] = 47
    
    winner = wins.keys.max{|a,b| wins[a] <=> wins[b]} || nil
    puts "#{winner} won #{sprintf("%.2f", wins[winner].to_f/100)}% of the time"
    winner
    
    # winner = 
    #     puts "#{players.first.inspect} played #{players.last.inspect}: #{winner.inspect} won!"
    #     winner
  end
  
  protected
  def seed; @seed ||= players + Array.new(nbyes, nil); end
  def nplayers; players.size; end
  def nrounds; Math.log2(nplayers).ceil; end
  def nbyes; (1 << nrounds) - nplayers; end
end