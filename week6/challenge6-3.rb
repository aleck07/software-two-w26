require 'minitest/autorun'

class BigClass
  def initialize(x)
    raise "You can't instantiate this because the evil prof said so"
    @foo = 12
    @something = x
  end

  def self.function_to_test(x, y, z)
    (x + y) * z
  end

  def self.expose
    method(:function_to_test)
  end
end

class BigClassTest < Minitest::Test
  def test_function_to_test
    fn = BigClass.expose
    result = fn.call(1, 2, 3)
    assert result == 9
  end
end