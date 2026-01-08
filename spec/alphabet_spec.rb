# frozen_string_literal: true

RSpec.describe 'Rumanu Alphabets' do
  describe 'VOWELS' do
    let(:vowels) { Rumanu::VOWELS }

    it 'is a Hash' do
      expect(vowels).to be_a(Hash)
    end

    it 'is frozen' do
      expect(vowels).to be_frozen
    end

    it 'is not empty' do
      expect(vowels).not_to be_empty
    end

    it 'has all string keys' do
      expect(vowels.keys).to all(be_a(String))
    end

    it 'has all integer values' do
      expect(vowels.values).to all(be_a(Integer))
    end

    it 'contains basic vowels' do
      expect(vowels).to include('a', 'e', 'i', 'o', 'u')
    end

    it 'contains accented vowels' do
      expect(vowels).to include('á', 'é', 'í', 'ó', 'ú')
    end

    it 'has correct Pythagorean values' do
      expect(vowels['a']).to eq(1)
      expect(vowels['e']).to eq(5)
      expect(vowels['i']).to eq(9)
      expect(vowels['o']).to eq(6)
      expect(vowels['u']).to eq(3)
    end

    it 'has values between 1 and 9' do
      expect(vowels.values).to all(be_between(1, 9))
    end
  end

  describe 'CONSONANTS' do
    let(:consonants) { Rumanu::CONSONANTS }

    it 'is a Hash' do
      expect(consonants).to be_a(Hash)
    end

    it 'is frozen' do
      expect(consonants).to be_frozen
    end

    it 'is not empty' do
      expect(consonants).not_to be_empty
    end

    it 'has all string keys' do
      expect(consonants.keys).to all(be_a(String))
    end

    it 'has all integer values' do
      expect(consonants.values).to all(be_a(Integer))
    end

    it 'contains common consonants' do
      expect(consonants).to include('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z')
    end

    it 'has correct Pythagorean values for sample letters' do
      expect(consonants['b']).to eq(2)
      expect(consonants['c']).to eq(3)
      expect(consonants['d']).to eq(4)
    end

    it 'has values between 1 and 9' do
      expect(consonants.values).to all(be_between(1, 9))
    end

    it 'does not overlap with vowels' do
      vowel_keys = Rumanu::VOWELS.keys.map { |k| k.gsub(/[áéíóúü]/, '') }.uniq
      consonant_keys = consonants.keys
      expect(vowel_keys & consonant_keys).to be_empty
    end
  end

  ###
  describe 'ALPHABET' do
    let(:alphabet) { Rumanu::ALPHABET }

    it 'is a Hash' do
      expect(alphabet).to be_a(Hash)
    end

    it 'is frozen' do
      expect(alphabet).to be_frozen
    end

    it 'is not empty' do
      expect(alphabet).not_to be_empty
    end

    it 'has all string keys' do
      expect(alphabet.keys).to all(be_a(String))
    end

    it 'has all integer values' do
      expect(alphabet.values).to all(be_a(Integer))
    end

    it 'contains common consonants' do
      expect(alphabet).to include('b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z')
    end


    it 'has values between 1 and 9' do
      expect(alphabet.values).to all(be_between(1, 9))
    end

    it 'includes all vowels and consonants' do
      expect(alphabet).to include(*Rumanu::VOWELS.keys)
      expect(alphabet).to include(*Rumanu::CONSONANTS.keys)
    end
  end
end
