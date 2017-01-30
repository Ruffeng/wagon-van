require "gosu"
require_relative "wagon"
require_relative "player"
require_relative "enemy"

mides = 130
background = Gosu::Image.new("./images/background.jpg", tileable: true)
player_picture = Gosu::Image.new("./images/van.png")
enemy_picture=Gosu::Image.new("./images/Cactus-Sprite.png")
#enemy_picture = Gosu::Image.load_tiles("./images/cactus2.png",80,mides)
Wagon.new(background, Player.new(player_picture), enemy_picture).show
