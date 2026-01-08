# frozen_string_literal: true

RSpec.describe Rumanu do
  it 'has a version number' do
    expect(Rumanu::VERSION).not_to be nil
    expect(Rumanu::VERSION).to match(/\d+\.\d+\.\d+/)
  end

  describe 'module constants' do
    it 'defines VOWELS constant' do
      expect(Rumanu::VOWELS).to be_a(Hash)
      expect(Rumanu::VOWELS).to be_frozen
    end

    it 'defines CONSONANTS constant' do
      expect(Rumanu::CONSONANTS).to be_a(Hash)
      expect(Rumanu::CONSONANTS).to be_frozen
    end
  end

  describe 'module methods' do
    let(:test_class) do
      Class.new do
        include Rumanu
      end.new
    end

    it 'includes digit_sum method' do
      expect(test_class).to respond_to(:digit_sum)
    end

    it 'includes reduce_list method' do
      expect(test_class).to respond_to(:reduce_list)
    end

    it 'includes valid_date? method' do
      expect(test_class).to respond_to(:valid_date?)
    end

    it 'includes valid_hash? method' do
      expect(test_class).to respond_to(:valid_hash?)
    end
  end
end
