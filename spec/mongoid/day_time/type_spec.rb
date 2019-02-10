RSpec.describe Mongoid::DayTime::Type do
  let(:subject) { Mongoid::DayTime::Type.from_string("10:10") }
  context "time from string" do
    let(:subject) { Mongoid::DayTime::Type.from_string("10:15") }

    it "#to_minutes" do
      expect(subject.to_minutes).to be 615
    end
  end

  context "time from minutes" do
    let(:subject) { Mongoid::DayTime::Type.from_minutes(615) }

    it "#to_minutes" do
      expect(subject.to_minutes).to be 615
    end

    it "#to_s" do
      expect(subject.to_s).to eq "10:15"
    end
  end

  context "mongoid instance methods" do
    it "#mongoize"
  end

  context "mongoid class methods" do
    it ".mongoize"

    it ".demongoize"

    it ".evolve"
  end

end
