require "pry-byebug"
class Enemy
  attr_reader :x,:y
  def initialize(animation)
    @animation = animation
    @y = 352
    #@x = rand * 480
    @x = 450
  end

  def draw


    img = @animation[Gosu.milliseconds / 150 % @animation.size]
    img.draw(400, 352,1)
  end
end

