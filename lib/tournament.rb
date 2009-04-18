#! /usr/bin/env ruby
Dir['contestants/*.rb'].each {|fh| require fh}
require 'lib/prs_strategy'

class Symbol
  def to_proc
    lambda {|obj| obj.send(self)}
  end
end

class << Math
  def log2(n); log(n) / log(2); end
end

class Array
  def half_size; size >> 1; end
  def top_half; self[0, half_size]; end
  def bottom_half; self[half_size, half_size]; end
end

class Tournament
  def initialize(strategy)
    @strategy = strategy
    @judge 
  end
  
  attr_reader :players, :matches
  def run(*players)
    raise "Tournament requires 2 or more players" if players.size < 2
    
    @players = players
    @matches = (0...nrounds).inject(seed) do |memo,_|
      memo.top_half.zip(memo.bottom_half.reverse)
    end
    
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
    
    unless @strategy.respond_to? :call
      raise ArgumentError, "Strategy #{@strategy.inspect} does not respond to \"call\""
    end
    
    winner = @strategy.call(players)
    puts "#{players.first.inspect} played #{players.last.inspect}: #{winner.inspect} won!"
    winner
  end
  
  protected
  def seed; @seed ||= players + Array.new(nbyes, nil); end
  def nplayers; players.size; end
  def nrounds; Math.log2(nplayers).ceil; end
  def nbyes; (1 << nrounds) - nplayers; end
end