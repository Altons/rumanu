# frozen_string_literal: true

require 'date'
module Rumanu
  def digit_sum(n)
    return 0 if n.zero?

    1 + (n - 1) % 9
  end

  def reduce_list(lst, alphabet)
    digit_sum(lst.map { |value| alphabet[value] }.compact.sum)
  end

  def valid_date?(str)
    valid_formats = [/\d{2}\.\d{2}\.\d{4}/, %r{\d{2}/\d{2}/\d{4}}, /\d{2}-\d{2}-\d{4}/, /\d{4}-\d{2}-\d{2}/]
    check_format = valid_formats.map { |f| f.match?(str) && 1 || 0 }.reduce(0, :+)
    raise ArgumentError, 'Incorrect date format' if check_format.zero?
  end

  def valid_hash?(h)
    raise ArgumentError, 'Object must me a Hash' unless h.is_a? Hash
    raise ArgumentError, 'Hash can not be empty' unless h.empty? true
  end
end
