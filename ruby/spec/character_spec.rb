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
end
