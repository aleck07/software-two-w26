require 'minitest/autorun'
require_relative 'animallist'

class FakeProductionAnimalList
  def initialize
    @list = []
  end

  def add_animal(a)
    @list.append(a)
    "ok"
  end

  def find_animal(a)
    i = @list.find_index(a)
    i == nil ? nil : @list[i]
  end

  def delete_animal(a)
    @list.delete(a)
    "deleted"
  end
end

class TestAnimalList < Minitest::Test
  def setup
    @al = FakeProductionAnimalList.new
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


