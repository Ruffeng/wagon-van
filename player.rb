class Player
  def initialize(image)
    @image = image
    @x = @y   = @angle = 0.0
    @score = @vel_y = @down_y = 0
    @allow = true
    @score = 0
    @game_over = false
    #testing.-----
    @double_jump = false
    @air = false

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
        @air = true
        (@vel_y*-1).times do
          @y+=0.5
        end
        @vel_y+=1
      end

      # Double jump. TESTING
      # --------
       # if @vel_y == 0 and @air
       #   puts "air"
       #   @double_jump = true
       #   @air = false
       # end

       if @vel_y == 0 and @air == true and @y == 352
        @double_jump = false
        @air = false
       end
       puts @y
      check_jump
  end

  def draw
    @image.draw_rot(@x,@y,2,@angle,0.5,0.5,0.3,0.3)
  end

  def jump(original)

   #TESTING
   if @double_jump
      #uts "Double!!!"
      #puts "inside"
      # puts @double_jump
       @double_jump = false
       #puts @vel_y
       #puts original
       @vel_y += original
       @down_y= -@vel_y
       #puts @down_y
       #puts @vel_y
   end
   # ---------
   if @vel_y == 0
     @vel_y = original
     @down_y = original * -1
     @double_jump = true
     @air = true
   end
  end
  def check_jump
    if @vel_y == 0 and @allow == false
        @vel_y = @down_y
        @down_y = 0
        @allow = true
    end
  end

  def avoid_enemies(enemies)
    enemies.each_with_index do |enemy,index|
       if Gosu.distance(@x,@y,enemy.x,enemy.y) < 45
        @game_over = true
       else
        @score += 0.05
       end
    end
  end

  def game_over?
    @game_over
  end

  def score
    @score
  end

end
