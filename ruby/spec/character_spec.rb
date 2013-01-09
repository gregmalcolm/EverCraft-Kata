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

end
