require "pry-byebug"
class Enemy
  attr_reader :x,:y
  def initialize(animation)
    @animation = animation
    @y = 307
    #@x = rand * 480
    @x = rand * 450
  end

  def draw
   # img = @animation[Gosu.milliseconds / 150 % @animation.size]
    @animation.draw(@x, @y,1,0.4,0.4)
  end
end

