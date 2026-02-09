require_relative "kitchensink.rb"
require "test/unit"

class TestKitchenSink < Test::Unit::TestCase

  def test_triangle_area
    k = KitchenSink.new
    # How on Earth do we test triangle_area?
    #
    # Refactor KitchenSink so you can test that the output is correct.
    #
    # And we still want to call this method in the test:
    k.triangle_area
  end

end
