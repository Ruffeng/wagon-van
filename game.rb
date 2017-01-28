require "gosu"
require_relative "wagon"

background = Gosu::Image.new("./images/background.jpg")
Wagon.new(background).show
