require "rumanu/version"
require "rumanu/helpers"
require "rumanu/alphabets"
module Rumanu
  class Numerology
    include Rumanu
    attr_reader :name, :alphabet, :dob, :vowels, :consonants
    DOB_PREFIXES = [/\d{2}\.\d{2}\.\d{4}/,
                    /\d{2}\/\d{2}\/\d{4}/,
                    /\d{2}-\d{2}-\d{4}/]

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
      raise ArgumentError.new("Name must be a string") unless arg.is_a? Hash
      raise ArgumentError.new("Name can't be blank") unless arg.empty? true
    end

    def validate_dob(arg)
      raise ArgumentError.new("Date of birth must be a string") unless arg.is_a? String
      raise ArgumentError.new("Date of birth can't be blank") unless arg.length > 0
      raise ArgumentError.new("Incorrect date format") unless arg.match(Regexp.union(DOB_PREFIXES))

  end

    private :validate_name, :validate_dob, :validate_alphabet, :prep_name

  end
end
