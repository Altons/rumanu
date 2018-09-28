require "rumanu/version"
require "rumanu/helpers"
require "rumanu/alphabets"
module Rumanu
  class Numerology
    attr_reader :name, :alphabet, :dob
    DOB_PREFIXES = [/\d{2}\.\d{2}\.\d{4}/,
                    /\d{2}\/\d{2}\/\d{4}/,
                    /\d{2}-\d{2}-\d{4}/]

    def initialize
      @alphabet = PY_ALPHABET
    end

    def name=(name)
      validate_name(name)
      @name = name

    end

    def dob=(dob)
      validate_dob(dob)
      @dob = dob
    end

    def alphabet=(alphabet)
      validate_dob(alphabet)
      @dob = dob
    end

    # Private methods

    def validate_name(arg)
      raise ArgumentError.new("Name must be a string") unless arg.is_a? String
      raise ArgumentError.new("Name can't be blank") unless arg.length > 0
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

    private :validate_name, :validate_dob, :validate_alphabet

  end
end
