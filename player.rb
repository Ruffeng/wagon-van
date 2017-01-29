class Player
  def initialize(image)
    @image = image
    @x = @y = @vel_x  = @angle = 0.0
    @score = @vel_y = @down_y = 0
    @allow = true
  end
  def warp(x,y)
    @x,@y = x,y
  end
  def update(jump_max)

      #UP
      if @vel_y > 0
        @allow = false
        @vel_y.times do
          @y-=0.5
        end
        @vel_y-=1
      end

      #DOWN
      if @vel_y == 0 and @allow == false
        @vel_y = @down_y
        @down_y = 0
        @allow = true
      end

        if @vel_y < 0
          (@vel_y*-1).times do
            @y+=0.5
          end
          @vel_y+=1
        end





      # if @vel_y < 0 then @vel_y.times{ @v-=1} end
  end
  def draw
    ##draw_rot(x, y, z, angle, center_x = 0.5, center_y = 0.5, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default) ⇒ void
    @image.draw_rot(@x,@y,1,@angle,0.5,0.5,0.3,0.3)
  end
  def jump(original)
     @vel_y = original
     @down_y = original * -1
    # if @y > original
    #   @y -= 8
    # end
  end
  def jump_down(original)
    #@vel_y = -14
    @vel_y = @vel_y == 0 ? -14 : @vel_y * -1

    # until @y >= original

    #   @y += 8
    # end
  end
  def move
    @y = @vel_y

  end
end
