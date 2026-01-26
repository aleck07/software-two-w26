class Mather
  def initialize(a, b)
    @a = a
    @b = b
  end

  def sum()
    @a + @b
  end

  def difference()
    @a - @b
  end

  def quotient()
    if @a.is_a?(Integer) && @b.is_a?(Integer) && @a % @b == 0
      @a / @b
    else
      @a.to_f / @b.to_f
    end
  end
end

