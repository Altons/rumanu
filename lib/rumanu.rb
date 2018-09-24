require "rumanu/version"
require "rumanu/helpers"
require "rumanu/keys"
require "rumanu/alphabets"
module Rumanu
  class Numerology
    attr_reader :name, :alphabet

    def initialize(name,dob)
      @name = name
      @dob = dob
      @alphabet = PY_ALPHABET
      validate_name!
    end

    def name=(name)
      validate_name! if name.empty?
      validate_name! unless name.is_a? String
      @name = name
    end

    # Private methods

    def validate_name!
      raise ArgumentError.new("Name must be a string") unless name.is_a? String
      raise ArgumentError.new("Name can't be blank") unless name.length > 0
    end

    private :validate_name!

  end
end
