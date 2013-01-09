require "./lib/character.rb"

describe Character do

  it "set the name to Tracy" do
    subject.name = "Tracy"
    subject.name.should == "Tracy"
  end

  it "can confirm the name is Gandalf" do
    subject.name.should == "Gandalf"
  end
end
