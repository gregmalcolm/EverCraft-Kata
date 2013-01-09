class Character
  attr_accessor :name
  attr_reader :alignment
  attr_reader :hp
  attr_reader :armor_class

  def initialize
    @name = "Gandalf"
    @alignment = :neutral
    @hp = 5
    @armor_class = 10
  end

  def alignment=(alignment)
    unless [:good, :evil, :neutral].include?(alignment)
      raise "Alignment #{alignment} is not supported"
    end
    @alignment = alignment
  end

  def take_damage(damage = 1, options = {})
    if options[:critical] == true
      damage *= 2
    end
    @hp -= damage
  end

  def dead?
    @hp <= 0
  end

end
