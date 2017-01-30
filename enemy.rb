require "pry-byebug"
class Enemy
  attr_reader :x,:y
  def initialize(animation)
    @animation = animation
    @y = 307
    #@x = rand * 480
    new_cactus
  end
  def update
     new_cactus if @x < 0
     @x -= 3
  end
  def draw
   # img = @animation[Gosu.milliseconds / 150 % @animation.size]
    @animation.draw(@x, @y,1,0.4,0.4)
  end
  def new_cactus
    @x = (rand * 450)+800
  end
end

