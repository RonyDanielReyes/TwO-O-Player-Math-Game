require './Player'

class Game

  ## constructor to start the game
  def initialize
    @turn = 0
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @over = false
    self.start
  end

  # method to start the game
  def start
    while !@over do
      @turn % 2 == 0 ? self.turn(@player1) : self.turn(@player2)
    end
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end

end