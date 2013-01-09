require "./lib/character.rb"

describe Character do

  it "set the name to Tracy" do
    subject.name = "Tracy"
    subject.name.should == "Tracy"
  end

  it "can confirm the name is Gandalf" do
    subject.name.should == "Gandalf"
  end

  it "can set the alignment to good" do
    subject.alignment = :good
    subject.alignment.should == :good
  end

  it "can set the alignment to neutral" do
    subject.alignment = :neutral
    subject.alignment.should == :neutral
  end

  it "can set the alignment to evil" do
    subject.alignment = :evil
    subject.alignment.should == :evil
  end

  it "has a default alignment of neutral" do
    subject.alignment.should == :neutral
  end

  it "will raise an exception when alignment is set improperly" do
    lambda { subject.alignment = :bad }.should raise_error(/not supported/)
  end

  it "has a default armor class of 10" do
    subject.armor_class.should == 10
  end

  it "has a default hp of 5" do
    subject.hp.should == 5
  end

  it "takes 1 damage" do
    subject.take_damage
    subject.hp.should == 4
  end

  it "takes double damage for a critical hit" do
    subject.take_damage(2, :critical => true)
    subject.hp.should == 1
  end

  it "is dead when hp is less than 0" do
    subject.take_damage(10)
    subject.dead?.should be_true
  end

  it "is alive when hp is more than 0" do
    subject.take_damage(1)
    subject.dead?.should be_false
  end

  context "when overriding constructor defaults" do
    subject do
      options = { :name => "Dennis",
                  :alignment => :evil }
      Character.new(options)
    end

    it "is Dennis" do
      subject.name.should == "Dennis"
    end

    it "is evil" do
      subject.alignment.should == :evil
    end
  end

  describe "abilities" do
    it "starts with a str of 10" do
      subject.strength.should == 10
    end
    it "starts with a dex of 10" do
      subject.dexterity.should == 10
    end
    it "starts with a con of 10" do
      subject.constitution.should == 10
    end
    it "starts with a wis of 10" do
      subject.wisdom.should == 10
    end
    it "starts with a int of 10" do
      subject.intelligence.should == 10
    end
    it "starts with a chr of 10" do
      subject.charisma.should == 10
    end

    it "is legal to set an ability to 1" do
      subject.strength = 1
      subject.strength.should == 1
    end

    it "is legal to set an ability to 20" do
      subject.dexterity = 20
      subject.dexterity.should == 20
    end

    it "abilities are capped start at 1" do
      subject.constitution = 0
      subject.constitution.should == 1
    end

    it "abilities are capped ending at 20" do
      subject.constitution = 21
      subject.constitution.should == 20
    end

    it "ability of 10 modifies to 0" do
      subject.modifier(10).should == 0
    end

    it "ability of 11 modifies to 0" do
      subject.modifier(11).should == 0
    end

    it "ability of 1 modifies to -5" do
      subject.modifier(1).should == -5
    end

    it "ability of 20 modifies to 5" do
      subject.modifier(20).should == 5
    end

    it "ability of 9 modifies to -1" do
      subject.modifier(9).should == -1
    end

  end

  describe "ability modifiers" do
    it "constitution of 10 gives max HP of 5" do
      subject.max_hp.should == 5
    end

    it "constitution of 20 gives max HP of 10" do
      subject.constitution = 20
      subject.max_hp.should == 10
    end

    it "constitution of 1 gives max HP of 1" do
      subject.constitution = 1
      subject.max_hp.should == 1
    end

    it "dexterity of 10 gives AC of 10" do
      subject.armor_class.should == 10
    end

    it "dexterity of 1 gives AC of 5" do
      subject.dexterity = 1
      subject.armor_class.should == 5
    end

  end

end
