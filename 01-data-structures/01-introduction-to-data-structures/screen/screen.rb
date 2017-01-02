require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(height){Array.new(width)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      matrix[x][y] = pixel
    end
  end

  def at(x, y)
    matrix[x][y]
  end

  private

  def inbounds(x, y)
    if (x >=0 && x <=width)
      if (y >=0 && y <= height)
        true
      end
    else
      false
    end
  end

end
