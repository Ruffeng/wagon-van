require 'gosu'

class Wagon < Gosu::Window
  def initialize(background)
    #size of the game
    super 640,480
    # The title of the game
    self.caption = "Le Wagon Game!"

    @background = background
  end

  def update
  end

  def draw
    @background.draw(0,0,0)
  end
end
