RSpec.describe Rumanu do
  let(:entity) {Rumanu::Numerology.new}
  let(:vowels) {Rumanu::VOWELS}
  let(:consonants) {Rumanu::CONSONANTS}

  it 'has a version number' do
    expect(Rumanu::VERSION).not_to be nil
  end

  context 'when vowels are valid' do
    before {vowels = {'a'=> 1,'e'=>5}}
    it 'is a Hash Object' do
      expect(vowels.is_a? Hash).to be true
    end
    it 'has at least one pair of key=>value' do
      expect(vowels.empty?).to be false
    end
    it 'has all values of numeric type' do
      expect(vowels.values.any? {|v| v.class == Integer}).to be true
    end
  end

  context 'when consonants are valid' do
    before {consonants = {'b'=> 1,'c'=>5}}
    it 'is a Hash Object' do
      expect(consonants.is_a? Hash).to be true
    end
    it 'has at least one pair of key=>value' do
      expect(consonants.empty?).to be false
    end
    it 'has all values of numeric type' do
      expect(consonants.values.any? {|v| v.class == Integer}).to be true
    end
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
             ['should raise ArgumentError if Hash is empty',Hash.new],
             ['should raise ArgumentError if Alphabet is malformed',{a:1,"b"=>23}]
            ]
    cases.each do |c|
      it c[0] do
        expect{entity.send(:validate_alphabet, c[1])}.to raise_error(ArgumentError)
      end
    end
  end

  context 'when the name is invalid' do
    cases = [['should raise ArgumentError if not string',nil],
             ['should raise ArgumentError if string is empty',''],
             ['should raise ArgumentError if string is made of numbers only','01234568899547'],
             ['should raise ArgumentError if string is made of special characters only',"?<>',?[]}{=-)(*&^%$#`~{}"],
             ['should raise ArgumentError if string is made of numbers / special chars only',"?<>',?[]}{=-87469)(*&^%$#`~{}"]
            ]
    cases.each do |c|
      it c[0] do
        expect{entity.send(:validate_name, c[1])}.to raise_error(ArgumentError)
      end
    end
  end
  #   context 'when the dob is invalid' do
  #     cases = [['should raise ArgumentError if not string',nil],
  #              ['should raise ArgumentError if string is empty',''],
  #              ['should raise ArgumentError if dob is malformed','1973/10/22']
  #             ]
  #     cases.each do |c|
  #       it c[0] do
  #         expect{entity.send(:validate_dob,c[1])}.to raise_error(ArgumentError)
  #       end
  #     end
  #   end
  #   context 'when dob is valid' do
  #     # before {entity.dob = '15/02/1948'}
  #     case1 = Rumanu::Numerology.new
  #     case1.dob = '15/02/1948'
  #     example "should return destiny number 3 for dob: #{case1.dob}" do
  #       expect(case1.destiny).to eq(3)
  #     end
  #     case2 = Rumanu::Numerology.new
  #     case2.dob = '09.10.1940'
  #     example "should return destiny number 4 for dob: #{case2.dob}" do
  #       expect(case2.destiny).to eq(6)
  #     end
  #     case3 = Rumanu::Numerology.new
  #     case3.dob = '1940-10-09'
  #     example "should return destiny number 4 for dob: #{case3.dob}" do
  #       expect(case2.destiny).to eq(6)
  #     end
  #   end
  #   context 'when name is valid' do
  #     str = "John Lennon"
  #     sc = Rumanu::Numerology.new
  #     sc.name = str
  #     example 'split name to char list with no blanks' do
  #       expect(sc.send(:prep_name)).to match_array str.gsub(" ","").downcase.split("")
  #     end
  #     example 'sum of all vowels (motivation) should be 8' do
  #       expect(sc.motivation).to eq(8)
  #     end
  #     example 'sum of all consonants (personality) should be 5' do
  #       expect(sc.personality).to eq(5)
  #     end
  #     example 'sum of all characters (expression) should be 4' do
  #       expect(sc.expression).to eq(4)
  #     end
  #   end
end
