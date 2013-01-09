require './lib/character'

class GameMaster
  def attack(attacker, defender, options = {} )
    roll = options[:dice]

    if roll > defender.armor_class
      defender.take_damage 1 + attacker.modifier(attacker.strength)
    end
  end
end
