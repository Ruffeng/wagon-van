require 'gosu'
require "pry-byebug"
class Wagon < Gosu::Window
  def initialize(background,player,enemy_picture)

    #size of the game
    super 640,480
    # The title of the game
    @original_y = 352
    @original_x = 170
    self.caption = "Le Wagon Game!"
    @background = background
    @player = player
    @player.warp(@original_x,@original_y)
    @enemies_pos = 800
    @enemies_size = 3
    @enemy_anim = enemy_picture
    @enemies = Array.new

    #Scrolling effect
    @x_back = @y_back =@x_enemy= 0
    @jump = true
    @jumpy = 25
  end
  def update
    # this variable is the one which takes care to move the background.
    # if u increase the number, then the velocity is faster
    # important to set a level

    @x_back -= 3
    if Gosu.button_down? Gosu::KbSpace and @jump
      @jump = false
      @player.jump(@jumpy)
    end
    @player.update(@jumpy)
    @enemies.each{|e|e.update(@enemies_pos)}


    if rand(100) < 4 and @enemies.size < @enemies_size
        pos_last_elem = @enemies.size == 0 ? 0 : @enemies.last.x
        @enemies.push(Enemy.new(@enemy_anim,@enemies_pos))
        @enemies_pos += 200
        @enemies_pos = 800 if @enemies_size == @enemies.size
    end
  end

  def draw
    # Calculating the new position of the background
    @local_x = @x_enemy =@x_back % -800
    @player.draw

    #IMPLEMENT
    @enemies.each(&:draw)

    # Drawing background
    @background.draw(@local_x,0,0)
    if @local_x < 0
      @background.draw(@local_x + 800,0,0)

    end

  end
  def button_down(id)
    if id == Gosu::KbEscape
      close
    else
      super
    end
  end
  def button_up(id)
    if id == Gosu::KbSpace
      @jump = true
    end
    super
  end
end
