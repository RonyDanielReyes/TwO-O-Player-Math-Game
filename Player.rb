class Player

  # adding the accessor of lives to be able to define getter and setters in a better way
  attr_accessor :lives

## adding the reader to be able to perfom the name when it's being called 
  attr_reader :name

## We will need the initialize to start with the game, 
  def initialize(name)
    @name = name
## as part of the parameters we have to start with 3 lives each player
    @lives = 3
  end

end

