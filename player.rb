
class Player

  attr_reader :name
  attr_reader :life
  attr_writer :life

  def initialize(name)
    @name = name
    @life = 3
  end

  def dead?
    @life <= 0
  end

end