# frozen_string_literal: true

RSpec.describe Rumanu::Meaning do
  describe 'Integer extensions' do
    it 'extends Integer class with meaning method' do
      expect(1).to respond_to(:meaning)
    end

    it 'extends Integer class with destiny method' do
      expect(1).to respond_to(:destiny)
    end
  end

  describe '#meaning' do
    context 'with valid numbers (1-9)' do
      it 'returns meaning hash for 1' do
        result = 1.meaning
        expect(result).to be_a(Hash)
        expect(result).to have_key('positive')
        expect(result).to have_key('negative')
      end

      it 'returns correct meaning for each number' do
        (1..9).each do |n|
          result = n.meaning
          expect(result).to be_a(Hash)
          expect(result['positive']).to be_a(String)
          expect(result['negative']).to be_a(String)
        end
      end

      it 'returns specific meanings for known numbers' do
        expect(1.meaning['positive']).to include('leadership')
        expect(8.meaning['positive']).to include('decisive')
        expect(9.meaning['positive']).to include('creative')
      end
    end

    context 'with invalid numbers' do
      it 'returns error message for 0' do
        expect(0.meaning).to eq('Value out of range. Please choose a number between 1 and 9')
      end

      it 'returns error message for 10' do
        expect(10.meaning).to eq('Value out of range. Please choose a number between 1 and 9')
      end

      it 'returns error message for negative numbers' do
        expect(-1.meaning).to eq('Value out of range. Please choose a number between 1 and 9')
      end
    end
  end

  describe '#destiny' do
    context 'with valid numbers (1-9)' do
      it 'returns destiny string for 1' do
        result = 1.destiny
        expect(result).to be_a(String)
        expect(result).to include('destiny')
      end

      it 'returns correct destiny for each number' do
        (1..9).each do |n|
          result = n.destiny
          expect(result).to be_a(String)
          expect(result).not_to be_empty
        end
      end

      it 'returns specific destinies for known numbers' do
        expect(1.destiny).to include('number 1')
        expect(6.destiny).to include('nurturing')
        expect(9.destiny).to include('consciousness')
      end
    end

    context 'with invalid numbers' do
      it 'returns error message for 0' do
        expect(0.destiny).to eq('Value out of range. Please choose a number between 1 and 9')
      end

      it 'returns error message for 10' do
        expect(10.destiny).to eq('Value out of range. Please choose a number between 1 and 9')
      end

      it 'returns error message for negative numbers' do
        expect(-1.destiny).to eq('Value out of range. Please choose a number between 1 and 9')
      end
    end
  end

  describe '#load_meaning' do
    let(:test_class) do
      Class.new do
        include Rumanu::Meaning
      end.new
    end

    it 'loads YAML file successfully' do
      result = test_class.load_meaning
      expect(result).to be_a(Hash)
    end

    it 'contains meaning key' do
      result = test_class.load_meaning
      expect(result).to have_key('meaning')
    end

    it 'contains destiny key' do
      result = test_class.load_meaning
      expect(result).to have_key('destiny')
    end

    it 'has meanings for all numbers 1-9' do
      result = test_class.load_meaning
      (1..9).each do |n|
        expect(result['meaning']).to have_key(n)
        expect(result['destiny']).to have_key(n)
      end
    end
  end
end
