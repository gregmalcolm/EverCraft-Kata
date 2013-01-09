class Character
  attr_accessor :name

  attr_reader :strength
  attr_reader :dexterity
  attr_reader :constitution
  attr_reader :wisdom
  attr_reader :intelligence
  attr_reader :charisma

  attr_reader :alignment
  attr_reader :hp

  def initialize(options = {})
    @name = options[:name] || "Gandalf"
    @alignment = options[:alignment] || :neutral
    @hp = 5
    init_abilities
  end

  def armor_class
    10 + modifier(dexterity)
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

  def strength=(value)
    @strength = legal_ability_value(value)
  end

  def dexterity=(value)
    @dexterity = legal_ability_value(value)
  end

  def constitution=(value)
    @constitution = legal_ability_value(value)
  end

  def wisdom=(value)
    @wisdom = legal_ability_value(value)
  end

  def intelligence=(value)
    @intelligence = legal_ability_value(value)
  end

  def charisma=(value)
    @charisma = legal_ability_value(value)
  end

  def modifier(value)
    (value - 10) / 2
  end

  def max_hp
    uncapped_hp < 1 ? 1 : uncapped_hp
  end

  private

  def uncapped_hp
    5 + modifier(@constitution)
  end

  def init_abilities
    @strength     = 10
    @dexterity    = 10
    @constitution = 10
    @wisdom       = 10
    @intelligence = 10
    @charisma     = 10
  end

  def legal_ability_value(value)
    value = value < 1 ? 1 : value
    value > 20 ? 20 : value
  end

end
