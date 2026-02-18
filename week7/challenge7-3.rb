require 'minitest/autorun'

class AntelopeManager
  def initialize
    sleep 3
    raise "AntelopeManager failed to connect to production server"
  end

  def compute_magic
    sleep(86400)
    698
  end
end

class AntelopeClassifier
  def classify(antelope_type)
    # ... lots more code ...
    make_antelope_manager
    magic = @am.compute_magic
    # ... lots more code ...
    antelope_type * magic
  end

  def make_antelope_manager
    @am = AntelopeManager.new
  end
end

class FakeAntelopeClassifier < AntelopeClassifier
  def make_antelope_manager
    @am = FakeAntelopeManager.new
  end
end

class FakeAntelopeManager
  def initialize
    # no-op
  end

  def compute_magic
    698
  end
end

class AntelopeClassifierTest < Minitest::Test
  def setup
    @ac = FakeAntelopeClassifier.new
  end

  def test_classify
    assert_equal 3490, @ac.classify(5)
  end
end