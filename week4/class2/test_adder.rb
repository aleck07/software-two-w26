# test_adder.rb

require 'minitest/autorun'
require_relative 'adder'

# For the challenge, don't modify anything in the AdderTest class:
class AdderThing
  def very_expensive_method
    puts "Skipping very_expensive_method"
  end
end

class AdderTest < Minitest::Test
  def test_addr()
    at = AdderThing.new
    assert(at.adder(2, 3) == 5)
    assert(at.adder(-20, 19) == -1)
    assert(at.adder(0, 0) == 0)
  end
end