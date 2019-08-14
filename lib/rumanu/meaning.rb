
require 'yaml'
module Rumanu
  module Meaning
    GEM_ROOT = File.expand_path("../..", __FILE__)
    def load_meaning
      YAML.load_file("#{GEM_ROOT}/rumanu/meanings/en.yml")
    end

    def meaning
      case self
      when 1..9
        return load_meaning[self]
      else
        return "Value out of range. Please choose a number between 1 and 9"
      end
    end
  end
end

class Integer
  include Rumanu::Meaning
end

