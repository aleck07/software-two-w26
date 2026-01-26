# Refactoring Exercise 3
# Alec Krsek

class IceBoxRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end
end

class BrokenRefrigerator

  attr_reader :height, :width, :depth

  def initialize(height = 0, width = 0, depth = 0)
    @height = height
    @width = width
    @depth = depth
  end

  def add(beverage)
  end

end

class RootBeer; end
class Kombucha; end

class Kitchen

  def initialize(refrigerator = IceBoxRefrigerator.new)
    @refrigerator = refrigerator
  end

  def add_beer_to_refrigerator(beverage = RootBeer.new)
    add_to_refrigerator(beverage)
  end

  def add_to_refrigerator(beverage)
    @refrigerator.add(beverage)
  end

  def to_s
    fridge_volume_gallons = calculate_fridge_volume
    "Kitchen. Fridge volume = #{fridge_volume_gallons} gallons"
  end

  private

  def calculate_fridge_volume
    fridge_volume = @refrigerator.height * @refrigerator.width * @refrigerator.depth
    fridge_volume * 7.48052
  end

end

# Current usage example:

kitchen = Kitchen.new
kitchen.add_beer_to_refrigerator
puts kitchen

# kitchen has an IceBoxRefrigerator with a RootBeer in it.

# Problem: you can't create a kitchen with a different fridge, and you can't
#          add any beverage other than beer.

# Goal: Create a kitchen with a BrokenRefrigerator, and add Kombucha to it.

betterKitchen = Kitchen.new(BrokenRefrigerator.new(5, 3, 2))
betterKitchen.add_to_refrigerator(Kombucha.new)
puts betterKitchen