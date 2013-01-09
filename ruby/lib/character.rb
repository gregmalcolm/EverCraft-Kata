class Character
  attr_accessor :name
  attr_reader :alignment

  def initialize
    @name = "Gandalf"
    @alignment = :neutral
  end

  def alignment=(alignment)
    unless [:good, :evil, :neutral].include?(alignment)
      raise "Alignment #{alignment} is not supported"
    end
    @alignment = alignment
  end

end
