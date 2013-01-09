require './lib/game_master'

describe GameMaster do
  before(:each) do
    @bob = Character.new(:name => "Bob")
    @bob.dexterity = 4

    @jenny = Character.new(:name => "Jenny")
    @jenny.strength = 15
  end

  it "bob can hit jenny for 1" do
    subject.attack(@bob, @jenny, :dice => 15)
    @jenny.hp.should == 4
  end

  it "jenny can hit bob for 3" do
    subject.attack(@jenny, @bob, :dice => 15)
    @bob.hp.should == 2
  end

  it "jenny can hit bob for 6 critical" do
    subject.attack(@jenny, @bob, :dice => 15)
    @bob.hp.should == 2
  end
end
