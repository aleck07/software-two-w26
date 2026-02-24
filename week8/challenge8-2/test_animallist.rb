require 'minitest/autorun'
require_relative 'problem'

class TestAnimalList < Minitest::Test
  def setup
    @al = AnimalList.new
  end

  def test_add_animal
    assert "ok" == @al.add_animal("cat")
  end

  def test_find_animal
    assert "ok" == @al.add_animal("dog")
    assert "dog" == @al.find_animal("dog")
    assert nil == @al.find_animal("cat")
  end

  def test_delete_animal
    assert "ok" == @al.add_animal("goat")
    assert "goat" == @al.find_animal("goat")
    assert "deleted" == @al.delete_animal("goat")
    assert nil == @al.find_animal("goat")
  end
end


