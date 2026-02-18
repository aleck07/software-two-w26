require 'minitest/autorun'

class AntelopeComputer
  attr_reader :computation_result

  def initialize
    sleep(1)
    @computation_result = 3490
  end
end

# All the references to @ac have to be removed in the class because everytime we reference the computation result from @ac, it will trigger the computation in AntelopeComputer with the sleep, not our cached computation.

class AntelopeClassifier
  def initialize
    # no-op
  end

  def lazy_getter
    @lazy_getter ||= AntelopeComputer.new.computation_result
  end

  def use_case_1
    lazy_getter * 1
  end

  def use_case_2
    2
  end

  def use_case_3
    3
  end

  def use_case_4
    lazy_getter * 4
  end

  def use_case_5
    5
  end

  def use_case_6
    6
  end

end

class AntelopeClassifierTest < Minitest::Test
  def setup
    @ac = AntelopeClassifier.new
  end

  def test_one
    assert_equal 3490, @ac.use_case_1
  end

  def test_two
    assert_equal 2, @ac.use_case_2
  end

  def test_three
    assert_equal 3, @ac.use_case_3
  end

  def test_four
    assert_equal 3490 * 4, @ac.use_case_4
  end

  def test_five
    assert_equal 5, @ac.use_case_5
  end

  def test_six
    assert_equal 6, @ac.use_case_6
  end

end