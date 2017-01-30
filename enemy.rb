require "pry-byebug"
class Enemy
  attr_reader :x,:y
  def initialize(animation,pos=800)
    @animation = animation
    @y = 307
    #@x = rand * 480

    new_cactus(pos)
  end
  def update(pos)
     new_cactus(pos) if @x < 0
     @x -= 5
  end
  def draw
   # img = @animation[Gosu.milliseconds / 150 % @animation.size]
    @animation.draw(@x, @y,1,0.4,0.4)
  end
  def new_cactus(pos)

    @x = (rand * 450)+pos
    # unless (@x - last_elem_position) > 100
    #   new_cactus(last_elem_position)
    # end
  end
end

