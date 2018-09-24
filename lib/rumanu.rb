require "rumanu/version"

module Rumanu
  class Numerology
    attr_accessor :name
    def initialize(name,dob)
      @name = name
      @dob = dob
      validate_name!
    end
    def name=(name)
      validate_name!
    end


    def validate_name!
      raise ArgumentError.new("Name must be a string") unless name.is_a? String
      raise ArgumentError.new("Name can't be blank") unless name.length > 0
    end

  end
end
