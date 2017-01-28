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
  end
  def update
  end

  def draw
    @player.draw
    @background.draw(0,0,0)
  end
end
