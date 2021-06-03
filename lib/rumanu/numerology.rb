# frozen_string_literal: true

module Rumanu
  class Numerology
    include Rumanu
    attr_reader :alphabet, :dob

    def initialize(name, dob, alphabet = nil)
      @vowels = VOWELS
      @consonants = CONSONANTS
      @alphabet = alphabet || vowels.merge(consonants)
      @name = name
      @dob = dob
    end


    private

      attr_reader :vowels, :consonants

      def prep_name
        @name.downcase.split('').delete_if { |i| i == ' ' }
      end

      def validate_name(arg)
        raise ArgumentError, 'Name must be a string' unless arg.is_a? String
        raise ArgumentError, "Name can't be blank" if arg.empty?
        unless arg.gsub(/[^A-Za-z ]/, '').empty?
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

    public

    def name
      @name.split.map(&:capitalize).join(' ').dup
    end

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

  end
end
