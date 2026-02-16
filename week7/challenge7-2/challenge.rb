require 'minitest/autorun'

class Production
  def self.do_antelope_production
    raise "Production is unavailable in testing"
  end
end

class AntelopeClassifier
  def classify(antelope_type)
    # ... lots more code ...
    Production.do_antelope_production
    # ... lots more code ...
    antelope_type * 698
  end

  def classify_with_fake(antelope_type)
    antelope_type * 698
  end
end

class FakeAntelopeClassifier < AntelopeClassifier
  def classify(antelope_type)
    classify_with_fake(antelope_type)
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