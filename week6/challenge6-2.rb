def activate
  puts "Activated!"
end

def make_counting_decorator(f)
  count = 0

  Proc.new do
    f.call
    count += 1
    puts count
  end
end

decorated_activate = make_counting_decorator(method(:activate))

decorated_activate.call
decorated_activate.call
decorated_activate.call
