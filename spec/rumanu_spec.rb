RSpec.describe Rumanu do

  it 'has a version number' do
    expect(Rumanu::VERSION).not_to be nil
  end
  context 'when alphabet is valid' do
    let(:entity) {Rumanu::Numerology.new("John Lennon","09-10-1940")}
    it 'is a Hash Object' do
      expect(entity.alphabet.is_a? Hash).to be true
    end
    it 'has at least one pair of key=>value' do
      expect(entity.alphabet.empty?).to be false
    end
  end
  context 'when the name is valid' do
    it "returns the name's vibration"
  end
  context 'when the name is invalid' do
    let(:entity2) {Rumanu::Numerology.new("","09-10-1940")}
    let(:entity3) {Rumanu::Numerology.new(nil,"24-08-1759")}
    it 'return an error message if not string' do
      expect{entity3.name}.to raise_error(ArgumentError)
    end
    it 'return an error message if string is empty' do
      expect{entity2.name}.to raise_error(ArgumentError)
    end

  end
end
