require "gosu"
require_relative "wagon"
require_relative "player"

background = Gosu::Image.new("./images/background.jpg", tileable: true)
player_picture = Gosu::Image.new("./images/van.png")

Wagon.new(background, Player.new(player_picture)).show
