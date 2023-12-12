class Player

  # adding the accessor of lives to be able to define getter and setters in a better way
  attr_accessor :lives

  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
  end
end

