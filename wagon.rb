require 'gosu'

class Wagon < Gosu::Window
  def initialize(background,player)
    #size of the game
    super 640,480
    # The title of the game
    self.caption = "Le Wagon Game!"
    @background = background
    @player = player
    @player.warp(170,352)
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
end
