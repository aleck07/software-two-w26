class KitchenSink
  # Don't add new parameters to or change the return type of
  # triangle_area!

  def triangle_area
    print 'Enter base: '
    base = gets.to_i
    print 'Enter height: '
    height = gets.to_i

    area = 0.5 * base * height;

    puts "The area is #{area}"
  end
end

