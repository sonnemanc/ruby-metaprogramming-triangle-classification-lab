class Triangle

  @@for_sum = []
    attr_accessor :a, :b, :c
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def valid_triangle?
    sides = [self.a,self.b,self.c]
    false if sides.any? { |side| side == 0 }
    true if sides.all? { |side| side == a }
    sides.inject(:+) - sides.max > sides.max ? true : false
  end

  def error_msg
    begin
      raise TriangleError
    end
  end

  def kind
    if valid_triangle? == false
      error_msg
    else
      if self.a == self.b && self.a == self.c
        :equilateral
      elsif self.a == self.b || self.a == self.c || self.b == self.c
        :isosceles
      elsif self.a != self.b && self.a != self.c && self.b != self.c
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
    end
  end
end
