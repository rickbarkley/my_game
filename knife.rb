class Knife
	def initialize(game_window)
		@game_window = game_window
		@icon = Gosu::Image.new(@game_window, "images/knife.png", true)
		reset!
	end
	
def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + 5
    end
  end
  
  def draw
    @icon.draw(@x,@y,2)
  end

  def x
    @x
  end

  def y
    @y
  end

  def reset!
    @y = 0
    @x = rand(@game_window.width)
  end
  
end