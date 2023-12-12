class Player

  # adding the accessor of lives to be able to define getter and setters in a better way
  attr_accessor :lives

## adding the reader to be able to perfom the name when it's being called 
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
  end

end

