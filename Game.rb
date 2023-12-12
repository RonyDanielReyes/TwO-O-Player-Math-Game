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
  
end