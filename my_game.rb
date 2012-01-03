$: << File.expand_path(File.dirname(__FILE__)) 
require 'rubygems'
require 'gosu'
require 'player'
require 'ball'
require 'knife'



class MyGame < Gosu::Window
	WIDTH = 640
 	HEIGHT = 480
 	TITLE = "Lydie and Hudson's Game"

	TOP_COLOR = Gosu::Color.new(0xFF1EB1FA)
 	BOTTOM_COLOR = Gosu::Color.new(0xFF1D4DB5)
 	
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = TITLE
   
    @last_frame = Gosu::milliseconds


    @player1 = Player.new(self)
    @ball = Ball.new(self)
    @knife = Knife.new(self)
    @running = true
  end

  def update
  	  	    calculate_delta
 end

 def calculate_delta
    @this_frame = Gosu::milliseconds
    @delta = (@this_frame - @last_frame) / 1000.0
    @last_frame = @this_frame



    if @running
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end

      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end

      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end

      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end

      @ball.update
      @knife.update  


      if @player1.hit_by? @ball
        stop_game!
         
    end
    	if @player1.hit_by? @knife
        stop_game!
        
    end
         
    else
      if button_down? Gosu::Button::KbEscape
        restart_game
      end
    end
  end

  def draw
  	
  	    draw_background
 end

 def draw_background
 	
    draw_quad(
     0,     0,      TOP_COLOR,
     WIDTH, 0,      TOP_COLOR,
     0,     HEIGHT, BOTTOM_COLOR,
     WIDTH, HEIGHT, BOTTOM_COLOR,
     0)

    @player1.draw
    @ball.draw
    @knife.draw
  end

  def stop_game!
    @running = false
  end

  def restart_game
    @running = true
    @ball.reset!
    @knife.reset!
  
  end

end

game = MyGame.new
game.show


	
	