$: << File.join(File.dirname(__FILE__), "/../lib")
require 'spec'
require 'throws'
Dir['lib/contestants/*.rb'].each {|fh| require fh}
require 'tournament'