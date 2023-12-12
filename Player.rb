# Require the Player class file to use its functionality in the Game class
require './Player'

# Game class definition
class Game
  # Constructor method to initialize the game
  def initialize
    # Initialize game variables
    @turn = 0
    @player1 = Player.new("Player 1") # Create player 1 object with name "Player 1"
    @player2 = Player.new("Player 2") # Create player 2 object with name "Player 2"
    @over = false # Variable to keep track of whether the game is over or not
    self.start # Start the game when initialized
  end

  # Method to start the game
  def start
    # Loop until @over becomes true (i.e., until the game is over)
    while !@over do
      # Ternary operator to switch turns between player 1 and player 2 based on @turn value
      @turn % 2 == 0 ? self.turn(@player1) : self.turn(@player2)
    end
    puts "--- GAME OVER ---" # Print message when the game is over
    puts "Goodbye!" # Print farewell message
  end

  # Method to handle a player's turn
  def turn(player)
    rand1 = rand(1..20) # Generate a random number between 1 and 20
    rand2 = rand(1..20) # Generate another random number between 1 and 20
    result = rand1 + rand2 # Calculate the sum of the two random numbers

    puts "--- NEW TURN ---" unless @turn == 0 # Print a new turn message except for the initial turn
    puts "#{player.name}: What does #{rand1} plus #{rand2} equal?" # Ask the player the math question
    answer = gets.chomp.to_i # Get the player's answer from the console and convert it to an integer

    @turn += 1 # Increment the turn count
    self.score(player, result == answer) # Check the player's answer and update the score
  end

  # Method to update player scores
  def score(player, bool)
    if bool
      puts "YES! You are correct." # Print a message if the answer is correct
    else
      puts "Seriously? No!" # Print a message if the answer is incorrect
      player.lives -= 1 # Reduce the player's lives by 1 for an incorrect answer
    end

    # Check if the game is over based on the players' remaining lives
    @over = (@player1.lives == 0 || @player2.lives == 0)
    if !@over
      # Display remaining lives for both players if the game is not over yet
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    else 
      # Determine and display the winner and their score if the game is over
      @player1.lives == 0 ? winner = @player2 : winner = @player1
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
    end
  end
end