require_relative "mather.rb"
require "minitest/autorun"

class TestMather < Minitest::Test

  def test_sum
    m = Mather.new(1, 2)
    assert_equal 3, m.sum
  end

  def test_difference
    m = Mather.new(1, 2)
    assert_equal(-1, m.difference)
  end

  def test_quotient
    m = Mather.new(15, 3)
    assert_equal(5, m.quotient)
    
    m = Mather.new(5, 2)
    assert_equal(2.5, m.quotient)
  end

end
