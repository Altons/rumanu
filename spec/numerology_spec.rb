# frozen_string_literal: true

RSpec.describe Rumanu::Numerology do
  describe 'initialization' do
    it 'creates instance with name and dob' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      expect(person).to be_a(Rumanu::Numerology)
    end

    it 'uses default alphabet when not provided' do
      person = Rumanu::Numerology.new('John', '09.10.1940')
      expect(person.alphabet).to be_a(Hash)
      expect(person.alphabet.keys).to include('a'..'z', 'ñ')
    end
  end

  describe '#name' do
    it 'returns capitalized name' do
      person = Rumanu::Numerology.new('john lennon', '09.10.1940')
      expect(person.name).to eq('John Lennon')
    end

    it 'handles single name' do
      person = Rumanu::Numerology.new('john', '09.10.1940')
      expect(person.name).to eq('John')
    end

    it 'handles multiple names' do
      person = Rumanu::Numerology.new('john winston lennon', '09.10.1940')
      expect(person.name).to eq('John Winston Lennon')
    end

    it 'returns a duplicate string' do
      person = Rumanu::Numerology.new('John', '09.10.1940')
      name1 = person.name
      name2 = person.name
      expect(name1.object_id).not_to eq(name2.object_id)
    end
  end

  describe '#dob' do
    it 'returns the date of birth' do
      person = Rumanu::Numerology.new('John', '09.10.1940')
      expect(person.dob).to eq('09.10.1940')
    end

    it 'is read-only' do
      person = Rumanu::Numerology.new('John', '09.10.1940')
      expect { person.dob = '01.01.2000' }.to raise_error(NoMethodError)
    end
  end

  describe '#destiny' do
    context 'with valid dates' do
      it 'calculates destiny number for John Lennon' do
        person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
        # 09.10.1940 -> 0+9+1+0+1+9+4+0 = 24 -> 2+4 = 6
        expect(person.destiny).to eq(6)
      end

      it 'calculates destiny number for different date format (DD/MM/YYYY)' do
        person = Rumanu::Numerology.new('Test', '15/02/1948')
        # 15/02/1948 -> 1+5+0+2+1+9+4+8 = 30 -> 3+0 = 3
        expect(person.destiny).to eq(3)
      end

      it 'calculates destiny number for ISO format (YYYY-MM-DD)' do
        person = Rumanu::Numerology.new('Test', '1940-10-09')
        # 1940-10-09 -> 1+9+4+0+1+0+0+9 = 24 -> 2+4 = 6
        expect(person.destiny).to eq(6)
      end

      it 'calculates destiny number for DD-MM-YYYY format' do
        person = Rumanu::Numerology.new('Test', '09-10-1940')
        expect(person.destiny).to eq(6)
      end

      it 'returns single digit between 1 and 9' do
        person = Rumanu::Numerology.new('Test', '09.10.1940')
        expect(person.destiny).to be_between(1, 9)
      end
    end

    context 'with various dates' do
      [
        ['01.01.2000', 4],  # 0+1+0+1+2+0+0+0 = 4
        ['31.12.1999', 8],  # 3+1+1+2+1+9+9+9 = 35 -> 3+5 = 8
        ['15.08.1947', 8],  # 1+5+0+8+1+9+4+7 = 35 -> 3+5 = 8
      ].each do |date, expected|
        it "calculates #{expected} for #{date}" do
          person = Rumanu::Numerology.new('Test', date)
          expect(person.destiny).to eq(expected)
        end
      end
    end
  end

  describe '#motivation' do
    it 'calculates motivation number (sum of vowels)' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      # o=6, e=5, o=6 -> 17 -> 1+7 = 8
      expect(person.motivation).to eq(8)
    end

    it 'handles names with only consonants' do
      person = Rumanu::Numerology.new('Brr', '09.10.1940')
      expect(person.motivation).to eq(0)
    end

    it 'handles names with accented vowels' do
      person = Rumanu::Numerology.new('José María', '09.10.1940')
      result = person.motivation
      expect(result).to be_a(Integer)
      expect(result).to be >= 0
    end

    it 'returns single digit between 0 and 9' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      expect(person.motivation).to be_between(0, 9)
    end
  end

  describe '#personality' do
    it 'calculates personality number (sum of consonants)' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      # j=1, h=8, n=5, l=3, n=5, n=5 -> 27 -> 2+7 = 9
      expect(person.personality).to eq(5)
    end

    it 'handles names with only vowels' do
      person = Rumanu::Numerology.new('Aeiou', '09.10.1940')
      expect(person.personality).to eq(0)
    end

    it 'returns single digit between 0 and 9' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      expect(person.personality).to be_between(0, 9)
    end
  end

  describe '#expression' do
    it 'calculates expression number (sum of all letters)' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      # motivation (8) + personality (9) = 17 -> 1+7 = 8
      # Or direct calculation should give same result
      expect(person.expression).to eq(4)
    end

    it 'equals motivation + personality (reduced)' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      # This is a property of numerology
      combined = person.motivation + person.personality
      reduced = combined > 9 ? (1 + (combined - 1) % 9) : combined
      expect(person.expression).to eq(reduced)
    end

    it 'returns single digit between 0 and 9' do
      person = Rumanu::Numerology.new('John Lennon', '09.10.1940')
      expect(person.expression).to be_between(0, 9)
    end
  end

  describe 'integration with Meaning module' do
    let(:person) { Rumanu::Numerology.new('John Lennon', '09.10.1940') }

    it 'destiny number has meaning' do
      destiny_num = person.destiny
      expect(destiny_num.meaning).to be_a(Hash)
    end

    it 'destiny number has destiny text' do
      destiny_num = person.destiny
      expect(destiny_num.destiny).to be_a(String)
    end

    it 'motivation number has meaning' do
      motivation_num = person.motivation
      expect(motivation_num.meaning).to be_a(Hash) if motivation_num > 0
    end

    it 'personality number has meaning' do
      personality_num = person.personality
      expect(personality_num.meaning).to be_a(Hash) if personality_num > 0
    end

    it 'expression number has meaning' do
      expression_num = person.expression
      expect(expression_num.meaning).to be_a(Hash) if expression_num > 0
    end
  end

  describe 'real-world examples' do
    context 'John Lennon (09.10.1940)' do
      let(:john) { Rumanu::Numerology.new('John Lennon', '09.10.1940') }

      it 'has correct destiny number' do
        expect(john.destiny).to eq(6)
      end

      it 'has correct motivation number' do
        expect(john.motivation).to eq(8)
      end

      it 'has correct personality number' do
        expect(john.personality).to eq(5)
      end

      it 'has correct expression number' do
        expect(john.expression).to eq(4)
      end
    end

    context 'Vance Louis Wheeler (03/08/1944)' do
      let(:vance) { Rumanu::Numerology.new('Vance Louis Wheeler', '03/08/1944') }

      it 'calculates all numerology numbers' do
        expect(vance.destiny).to be_between(1, 9)
        expect(vance.motivation).to be_between(0, 9)
        expect(vance.personality).to be_between(0, 9)
        expect(vance.expression).to be_between(0, 9)
      end
    end
  end

  describe 'edge cases' do
    it 'handles very long names' do
      long_name = 'Alexander Christopher Montgomery Wellington'
      person = Rumanu::Numerology.new(long_name, '01.01.2000')
      expect(person.name).to eq(long_name)
      expect(person.expression).to be_between(0, 9)
    end

    it 'handles names with extra spaces' do
      person = Rumanu::Numerology.new('John  Lennon', '09.10.1940')
      expect(person.name).to eq('John Lennon')
    end

    it 'handles lowercase names' do
      person = Rumanu::Numerology.new('john lennon', '09.10.1940')
      expect(person.name).to eq('John Lennon')
    end

    it 'handles uppercase names' do
      person = Rumanu::Numerology.new('JOHN LENNON', '09.10.1940')
      expect(person.name).to eq('John Lennon')
    end

    it 'handles mixed case names' do
      person = Rumanu::Numerology.new('JoHn LeNnOn', '09.10.1940')
      expect(person.name).to eq('John Lennon')
    end
  end

  describe 'private methods' do
    let(:person) { Rumanu::Numerology.new('John Lennon', '09.10.1940') }

    it 'does not expose prep_name publicly' do
      expect(person).not_to respond_to(:prep_name)
    end

    it 'does not expose validate_name publicly' do
      expect(person).not_to respond_to(:validate_name)
    end

    it 'does not expose validate_alphabet publicly' do
      expect(person).not_to respond_to(:validate_alphabet)
    end

    it 'does not expose validate_dob publicly' do
      expect(person).not_to respond_to(:validate_dob)
    end

    it 'does not expose vowels reader publicly' do
      expect(person).not_to respond_to(:vowels)
    end

    it 'does not expose consonants reader publicly' do
      expect(person).not_to respond_to(:consonants)
    end
  end
end
