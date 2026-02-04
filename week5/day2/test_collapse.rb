require "minitest/autorun"
require_relative "collapse"

class TestCollapse < Minitest::Test
  def test_collapses_run_of_letter
    assert_equal "fo", collapse("fooooooo", "o")
    assert_equal "fbar", collapse("fbbbar", "b")
    assert_equal "fb bar", collapse("fbbbbbbb bbbbbbar", "b")

    assert_equal "ac", collapse("aaaac", "a") # <-- failng case
  end
end

# The general case that breaks how this function behaves is when the character we want to collapse is the first character in the string.