RSpec.describe Rumanu do
  let(:entity) {Rumanu::Numerology.new}

  it 'has a version number' do
    expect(Rumanu::VERSION).not_to be nil
  end

  context 'when alphabet is valid' do
    it 'is a Hash Object' do
      expect(entity.alphabet.is_a? Hash).to be true
    end
    it 'has at least one pair of key=>value' do
      expect(entity.alphabet.empty?).to be false
    end
  end

  context 'when the alphabet is invalid' do
    cases = [['should raise ArgumentError if not Hash',nil],
             ['should raise ArgumentError if Hash is empty',Hash.new]
            ]
    cases.each do |c|
      it c[0] do
        expect{entity.send(:validate_alphabet, c[1])}.to raise_error(ArgumentError)
      end
    end
  end

  context 'when the name is invalid' do
    cases = [['should raise ArgumentError if not string',nil],
             ['should raise ArgumentError if string is empty','']
            ]
    cases.each do |c|
      it c[0] do
        expect{entity.send(:validate_name, c[1])}.to raise_error(ArgumentError)
      end
    end
  end
    context 'when the dob is invalid' do
      cases = [['should raise ArgumentError if not string',nil],
               ['should raise ArgumentError if string is empty',''],
               ['should raise ArgumentError if dob is malformed','1973/10/22']
              ]
      cases.each do |c|
        it c[0] do
          expect{entity.send(:validate_dob,c[1])}.to raise_error(ArgumentError)
        end
      end
    end
end
