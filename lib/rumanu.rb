require "rumanu/version"
require "rumanu/helpers"
require "rumanu/alphabets"
module Rumanu
  class Numerology
    include Rumanu
    attr_reader :name, :alphabet, :dob, :vowels, :consonants

    def initialize
      @vowels = PY_VOWELS
      @consonants = PY_CONSONANTS
      @alphabet = @vowels.merge @consonants

    end

    def name=(name)
      validate_name(name)
      @name = name.downcase

    end

    def dob=(dob)
      validate_dob(dob)
      @dob = dob
    end

    # def alphabet=(alphabet)
    #   validate_alphabet(alphabet)
    #   @alphabet = alphabet
    # end

    def vowels=(vowels)
      #validate_alphabet(alphabet)
      @vowels = vowels
    end

    def consonants=(consonants)
      #validate_alphabet(alphabet)
      @consonants = consonants
    end

    def destiny
      r = dob.split(/\.|-|\//).inject(0) {|sum,element| sum+element.to_i}
      value = digit_sum(r)
      return value unless value.to_s.length >1
      digit_sum(value)
    end

    # Sum of all name's vowels
    def motivation
      reduce_list(prep_name, @vowels)
    end


    # Private methods

    def prep_name
      name.split('').delete_if{|i| i == " "}
    end

    def validate_name(arg)
      raise ArgumentError.new("Name must be a string") unless arg.is_a? String
      raise ArgumentError.new("Name can't be blank") unless arg.length > 0
      raise ArgumentError.new("Name can't be just numbers or special characters") unless arg.gsub(/[^A-Za-z ]/, '').length > 0
    end

    def validate_alphabet(arg)
      valid_hash?(arg)
      valid_alphabet = arg.map {|k,v| k.is_a?(String) && v.is_a?(Integer) && 1 || 0 }.reduce(0,:+)
      raise ArgumentError.new("Invalid Alphabet") unless valid_alphabet>0

    end

    def validate_dob(arg)
      valid_date?(arg)
  end

    private :validate_name, :validate_dob, :validate_alphabet, :prep_name

  end
end
