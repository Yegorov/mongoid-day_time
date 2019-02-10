RSpec.describe Mongoid::DayTime do
  it "has a version number" do
    expect(Mongoid::DayTime::VERSION).not_to be nil
  end

  it "has a Mongoid::DayTime::Type class" do
    expect(Mongoid::DayTime::Type).not_to be_nil
  end
end
