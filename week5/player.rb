class Player
  attr_reader :name, :hit_points

  def initialize(name)
    @name = name
    @hit_points = 12
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def decrease_hp(n)
    @hit_points -= n
    notify_observers(n)
  end


  def notify_observers(delta)
    @observers.each do |observer|
      observer.on_hit_point_loss(self, delta)
    end
  end
end

class Observer1
  def on_hit_point_loss(p, delta)
    puts "player #{p.name} has lost #{delta} hit points"
  end
end

class Observer2
  def on_hit_point_loss(p, delta)
    puts "Oh noes! Player #{p.name} has lost #{delta} HP"
  end
end


o1 = Observer1.new
o2 = Observer2.new

p = Player.new("Alfred")

p.add_observer(o1)
p.add_observer(o2)

p.decrease_hp(5)
