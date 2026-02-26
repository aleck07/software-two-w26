class Player
  attr_accessor :xpos, :ypos, :treasure
  attr_reader :counter

  def initialize(name)
    @name = name
    @treasure = 0
    @xpos = 0
    @ypos = 0
    @counter = 0
  end

  def set_x(xpos)
    inc_counter
    @xpos = xpos
  end

  def set_y(ypos)
    inc_counter
    @ypos = ypos
  end

  def inc_counter
    @counter += 1
  end

end

# Production code:

def warp_player(player, xpos, ypos)
  player.set_x(xpos)
  player.set_y(ypos)
end

def handle_move(player, dir)
  case dir
  when "n"
    player.set_y(player.ypos - 1)
  when "s"
    player.set_y(player.ypos + 1)
  when "w"
    player.set_x(player.xpos - 1)
  when "e"
    player.set_x(player.xpos + 1)
  end
end

# -----------
# PRETEND THERE ARE 8234 ZILLION OTHER FUNCTIONS THAT MODIFY
# THE PLAYER POSITION.
# -----------

def description(x, y)
  # AI-generated
  descriptions = [
    'A winding dirt path through tall grass',
    'A crumbling stone bridge over a narrow stream',
    'An abandoned wooden cart with one broken wheel',
    'A clearing surrounded by moss-covered boulders',
    'The entrance to a dark cave',
    'A lonely watchtower on a hillside',
    'Dense fog rolling between ancient oaks',
    'A patch of wildflowers swaying in the breeze',
    'The ruins of an old stone wall',
    'A shallow pond reflecting the cloudy sky',
    'Rocky cliffs stretching upward into mist',
    'A wooden sign pointing in three directions',
    'Tangled vines hanging from gnarled branches',
    'A small campfire with embers still glowing',
    'Footprints leading into the underbrush',
    'A weathered statue covered in ivy',
    'Moonlight filtering through the canopy above',
    'A rope bridge swaying over a ravine',
    'Strange mushrooms growing in a circle',
    'The silhouette of distant mountains at dusk',
  ]

  descriptions[(x*3+y*7) % descriptions.length]
end

p = Player.new("Beej")

warp_player(p, 2, -3)

game_over = false

while !game_over
  if p.xpos == 3 && p.ypos == -1
    p.treasure += 10
  end

  puts "\nYou are at position (#{p.xpos},#{p.ypos}), turn #{p.counter}."
  puts "You see: #{description(p.xpos, p.ypos)}."

  print "\nEnter direction (n,s,w,e):"
  STDOUT.flush
  dir = gets.chomp
  handle_move(p, dir)

  if p.xpos == 0 and p.ypos == 0
    game_over = true
  end
end

puts "\nYou reached the north pole! Good job!"
puts "You collected $#{p.treasure} in treasure!"