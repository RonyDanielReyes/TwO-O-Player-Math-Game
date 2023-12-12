require './Player'

class Game

  ## constructor to start the game
  def initialize

    # we started with turn 0
    @turn = 0

    # creating new players 
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    # over will help us to track when the game is over
    @over = false

    ## this help to start the game when it is initialize.
    self.start
  end

  # method to start the game
  def start

    #looping until over becomes true or until the game is over
    while !@over do
      # operator to switch turns between player 1 and player 2 based in the value of the turn
      @turn % 2 == 0 ? self.turn(@player1) : self.turn(@player2)
    end
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end

  ## method to handle each player turn
  def turn(player)
    # generating the random numbers
    rand1 = rand(1..20)
    rand2 = rand(1..20)

    result = rand1 + rand2

    ## print a new turn, except for the initial one
    puts "--- NEW TURN ---" unless @turn == 0
    puts "#{player.name}: What does #{rand1} plus #{rand2} equal?"

    # get the player result from the terminal and convert it to an integer
    answer = gets.chomp.to_i
    ## increment the turn count
    @turn += 1
    ## check the player answer and update the score
    self.score(player, result == answer)
  end

## adding method to update player score  
  def score(player, bool)
    if bool
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
      ## if the answer is not right, reduce 1 life from the player's lives
      player.lives -= 1
    end

    ## check if the game is finish based on the player's remaining lives
    @over = (@player1.lives == 0 or @player2.lives == 0)
    if !@over
    # Display remaining lives for both players if the game is not over yet
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      ## determine and display the winner and their score if the game is over
      @player1.lives == 0 ? winner = @player2 : winner = @player1
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
    end
  end
end