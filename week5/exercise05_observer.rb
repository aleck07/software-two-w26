# Alec Krsek
# Exercise 5: Observer Pattern

class WeatherStation

  attr_accessor :temperature

  def initialize
    @temperature = 0
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def temperature=(new_temperature)
    @temperature = new_temperature
    @observers.each do |o|
      o.notify(self)
    end
  end

end

class StationObserver
  def notify(weather_station)
    puts "The temperature is #{weather_station.temperature} degrees."
  end
end

weather_station = WeatherStation.new
observer = StationObserver.new
weather_station.add_observer(observer)

weather_station.temperature = 72
