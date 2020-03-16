# frozen_string_literal: true

require 'yaml'
module Rumanu
  module Meaning
    GEM_ROOT = File.expand_path('..', __dir__)
    def load_meaning
      YAML.load_file("#{GEM_ROOT}/rumanu/meanings/en.yml")
    end

    def meaning
      case self
      when 1..9
        load_meaning['meaning'][self]
      else
        'Value out of range. Please choose a number between 1 and 9'
      end
    end

    def destiny
      case self
      when 1..9
        load_meaning['destiny'][self]
      else
        'Value out of range. Please choose a number between 1 and 9'
      end
    end
  end
end

class Integer
  include Rumanu::Meaning
end
