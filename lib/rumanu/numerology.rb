# frozen_string_literal: true

module Rumanu
  class Numerology
    include Rumanu
    attr_reader :alphabet, :dob, :vowels, :consonants

    def initialize(name = 'Vance Louis Wheeler', dob = '03/08/1944')
      @vowels = PY_VOWELS
      @consonants = PY_CONSONANTS
      @alphabet = @vowels.merge @consonants
      @name = name
      @dob = dob
    end

    def name=(name)
      validate_name(name)
      @name = name
    end

    def name
      @name.split.map(&:capitalize).join(' ').dup
    end

    def dob=(dob)
      validate_dob(dob)
      @dob = dob
    end

    # def alphabet=(alphabet)
    #   validate_alphabet(alphabet)
    #   @alphabet = alphabet
    # end

    attr_writer :vowels

    attr_writer :consonants

    def destiny
      r = dob.split(%r{\.|-|/}).inject(0) { |sum, element| sum + element.to_i }
      value = digit_sum(r)
      return value unless value.to_s.length > 1

      digit_sum(value)
    end

    # Sum of all name's vowels
    def motivation
      reduce_list(prep_name, @vowels)
    end

    # Sum of all name's consonants
    def personality
      reduce_list(prep_name, @consonants)
    end

    # Sum of all name's characters
    def expression
      reduce_list(prep_name, @alphabet)
    end

    # Private methods

    def prep_name
      @name.downcase.split('').delete_if { |i| i == ' ' }
    end

    def validate_name(arg)
      raise ArgumentError, 'Name must be a string' unless arg.is_a? String
      raise ArgumentError, "Name can't be blank" if arg.empty?
      if arg.gsub(/[^A-Za-z ]/, '').empty?
        raise ArgumentError, "Name can't be just numbers or special characters"
      end
    end

    def validate_alphabet(arg)
      valid_hash?(arg)
      valid_alphabet = arg.map { |k, v| k.is_a?(String) && v.is_a?(Integer) && 1 || 0 }.reduce(0, :+)
      raise ArgumentError, 'Invalid Alphabet' unless valid_alphabet > 0
    end

    def validate_dob(arg)
      valid_date?(arg)
  end

    private :validate_name, :validate_dob, :validate_alphabet, :prep_name
  end
end
