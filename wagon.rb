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
    @x_back -= 10
    @coordinates = Gosu::Image.from_text(
      self, "x: #{@x_back} - loc: #{@local_x} bgwidth : #{@background.width}",Gosu.default_font_name, 30)

  end

  def draw
    @local_x = @x_back % -640
    @player.draw
    if @local_x < 0
      @background.draw(@local_x + 640,0,0)
    end
    @coordinates.draw(0,0,1)
  end
end
