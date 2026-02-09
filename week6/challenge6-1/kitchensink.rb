class KitchenSink
  # Don't add new parameters to or change the return type of
  # triangle_area!

  def initialize(keyboard = STDIN, screen = STDOUT)
    @keyboard = keyboard
    @screen = screen
  end

  def get_base_height
    @screen.print 'Enter base: '
    base = @keyboard.gets.to_i
    @screen.print 'Enter height: '
    height = @keyboard.gets.to_i

    return base, height
  end

  def triangle_area
    base, height = get_base_height

    area = 0.5 * base * height;

    @screen.puts "The area is #{area}"
  end
end

class FakeKeyboard
  attr_reader :inputs

  def initialize(inputs)
    @inputs = inputs
  end

  def gets
    @inputs.shift
  end
end

class FakeScreen
  attr_reader :output

  def initialize
    @output = ""
  end

  def puts(str)
    @output += str + "\n"
  end

  def print(str)
    # nothing
  end
end

class FakeKitchenSink < KitchenSink
  attr_reader :output

  def initialize(fake_keyboard, fake_screen)
    super(fake_keyboard, fake_screen)
    @output = ""
  end 

  def get_base_height
    base = @keyboard.gets.to_i
    height = @keyboard.gets.to_i

    return base, height
  end
end

