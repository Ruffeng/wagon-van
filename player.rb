class Player
  def initialize(image)
    @image = image
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end
  def warp(x,y)
    @x,@y = x,y
  end

  def draw
    @image.draw_rot(@x,@y,1,@angle)
  end
end
