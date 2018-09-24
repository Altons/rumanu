RSpec.describe Rumanu do
  let(:entity) {Rumanu::Numerology.new("John Lennon","09-10-1940")}
  let(:entity2) {Rumanu::Numerology.new("William Wilberforce","24-08-1759")}
  it "has a version number" do
    expect(Rumanu::VERSION).not_to be nil
  end
  context "with a valid name" do
    it 'is a string' do
      expect(entity.name.is_a? String).to be true
    end
    it "has more than 5 characters" do
      expect(entity.name.length).to be >= 5
    end
  end
  it "raises an error if name is not a String"
  it "raises and error if name is blank"
  it "raises and error if name has less than 5 chars"
end
