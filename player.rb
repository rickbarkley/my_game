class Player
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/player1.png", true)
    @x = 90
    @y = 330
  end
  
  def draw
    @icon.draw(@x,@y,1)
  end
  
  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end
  
  def move_right
    if @x > (@game_window.width - 75)
      @x = @game_window.width - 75
    else
      @x = @x + 10
    end
  end
  
  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end
  
  def move_down
    if @y > (@game_window.height-75)
      @y = @game_window.height - 75
    else
      @y = @y + 10
    end
  end

  def hit_by?(ball)
    Gosu::distance(@x, @y, ball.x, ball.y) < 50
  end
    def hit_by?(knife)
    Gosu::distance(@x, @y, knife.x, knife.y) < 40
end
end
