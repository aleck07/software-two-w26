require_relative "kitchensink.rb"
require "minitest/autorun"

class TestKitchenSink < Minitest::Test

  def test_triangle_area
    fake_keyboard = FakeKeyboard.new(["10", "5"])
    fake_screen = FakeScreen.new
    k = FakeKitchenSink.new(fake_keyboard, fake_screen)
    k.triangle_area
    assert_equal("The area is 25.0\n", fake_screen.output)
  end

end
