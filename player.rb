class Player
  def initialize(image)
    @image = image
    @x = @y   = @angle = 0.0
    @score = @vel_y = @down_y = 0
    @allow = true
  end
  def warp(x,y)
    @x,@y = x,y
  end
  def update(jump_max)
      #Jump UP
      if @vel_y > 0
        @allow = false
        @vel_y.times do
          @y-=0.5
        end
        @vel_y-=1
      end

      #Jump DOWN
      if @vel_y < 0
        (@vel_y*-1).times do
          @y+=0.5
        end
        @vel_y+=1
      end
      check_jump
  end
  def draw
    @image.draw_rot(@x,@y,1,@angle,0.5,0.5,0.3,0.3)
  end
  def jump(original)
     @vel_y = original
     @down_y = original * -1

  end
  def check_jump
    if @vel_y == 0 and @allow == false
        @vel_y = @down_y
        @down_y = 0
        @allow = true
      end
    end
end
