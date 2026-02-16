#! /usr/bin/env ruby
# Alec Krsek
# Exercise 6: Decorator Pattern

# Do not modify this class. Pretend it is from a library that is "closed."
class HyperCar

  def initialize(sound)
    @sound = sound
  end

  def go
    3.times { puts @sound }
  end

end

# Do not modify this class. Pretend it is from a library that is "closed."
class CarService

  def initialize(car)
    @car = car
  end

  def execute
    @car.go
  end
end

hyper_car = HyperCar.new("bzzzz")
service = CarService.new(hyper_car)
service.execute

# TODO Exercise, using the decorator pattern. Can you add new behavior without
# changing the HyperCar class or the CarService class?


class NoisyCarDecorator

  def initialize(car)
    @car = car
  end

  def go
    puts "awooga!"
    @car.go
    puts "waka waka waka!"
  end

end

noisy_hyper_car = NoisyCarDecorator.new(hyper_car)
second_service = CarService.new(noisy_hyper_car)

second_service.execute
# This `execute` call should print:
# > awooga!
# > bzzzz
# > bzzzz
# > bzzzz
# > waka waka waka!
