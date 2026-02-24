class AnimalList
  def initialize
    raise "abstract class"
  end

  def add_animal(a)
    raise "abstract method"
  end

  def find_animal(a)
    raise "abstract method"
  end

  def delete_animal(a)
    raise "abstract method"
  end
end

class ProductionAnimalList < AnimalList
  def initialize
    sleep(3)
    @list = []
  end

  def add_animal(a)
    sleep(3)
    @list.append(a)
    "ok"
  end

  def find_animal(a)
    sleep(3)
    i = @list.find_index(a)
    i == nil ? nil : @list[i]
  end

  def delete_animal(a)
    sleep(3)
    @list.delete(a)
    "deleted"
  end
end

if __FILE__ == $0
  # PRODUCTION CODE:
  aimfiz = ProductionAnimalList.new
  aimfiz.add_animal("dog");

  bekdab = ProductionAnimalList.new
  bekdab.add_animal("dog");
  bekdab.add_animal("cat");
  x = bekdab.find_animal("cat");
  bekdab.delete_animal("cat");

  malyon = ProductionAnimalList.new

  plugh = ProductionAnimalList.new

  throck = ProductionAnimalList.new

  vomin = ProductionAnimalList.new

  zemdor = ProductionAnimalList.new
end
