require "gosu"
require_relative "wagon"

background = Gosu::Image.new("./images/background.jpg", tileable: true)
Wagon.new(background).show
