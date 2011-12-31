$: << File.expand_path(File.dirname(__FILE__)) 
require 'rubygems'
require 'gosu'
require 'player'


class MyGame < Gosu::Window
  def initialize
    super(600, 400, false)
    @player = Player.new(self)
  end

  def update
  	if button_down? Gosu::Button::KbLeft
  		@player.move_left
  	end
  	if button_down? Gosu::Button::KbRight
  		@player.move_right
  	
  	end
  	
  	if button_down? Gosu::Button::KbDown
  		@player.move_down
  		end
  		
  	if button_down? Gosu::Button::KbUp
  		@player.move_up
  		
  	end
  	end
  	 	 
  	
    def draw
    	@player.draw
	end
	
 
  
end
window = MyGame.new
window.show


	
	