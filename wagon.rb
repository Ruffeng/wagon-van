require 'gosu'

class Wagon < Gosu::Window
  def initialize(background,player)
    #size of the game
    super 640,480
    # The title of the game
    @original_y = 352
    @original_x = 170
    self.caption = "Le Wagon Game!"
    @background = background
    @player = player
    @player.warp(@original_x,@original_y)
    #Scrolling effect
    @x_back = @y_back = 0

  end
  def update
    # this variable is the one which takes care to move the background.
    # if u increase the number, then the velocity is faster
    # important to set a level
    @x_back -= 3
    # @coordinates = Gosu::Image.from_text(
    #   self, "x: #{@x_back} - loc: #{@local_x} bgwidth : #{@background.width}",Gosu.default_font_name, 30)
    if Gosu.button_down? Gosu::KbSpace
      @player.jump(@original_y - 200)
    end
    #if Gosu.button_up? Gosu::KbSpace
      #puts "hi"
      #@player.jump_down(@original_y - 200)
    #end
  end

  def draw
    # Calculating the new position of the background
    @local_x = @x_back % -800
    @player.draw
    # Drawing background
    @background.draw(@local_x,0,0)
    if @local_x < 0
      @background.draw(@local_x + 800,0,0)
    end
    #@coordinates.draw(0,0,1)
  end
  def button_down(id)
    if id == Gosu::KbEscape
      close
    else
      super
    end
  end
  def button_up(id)
    puts "hi"
    super
  end
end
