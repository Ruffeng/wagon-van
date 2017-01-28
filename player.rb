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
    ##draw_rot(x, y, z, angle, center_x = 0.5, center_y = 0.5, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default) ⇒ void
    @image.draw_rot(@x,@y,1,@angle,0.5,0.5,0.3,0.3)
  end
  def jump(original)
    if @y > original
      @y -= 8
    end
  end
  def jump_down(original)
    if @y < original
      @y += 8
    end
  end
  def move
    @y = @vel_y

  end
end
