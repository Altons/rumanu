require 'date'
module Rumanu

  def digit_sum(n)
    cum = 0
    n.to_s.each_char { |c| cum+=c.to_i}
    cum = digit_sum(cum) unless cum.to_s.length == 1
    cum
  end

  def reduce_list(l,alphabet)
    init = 0
    l.each do |c|
        alphabet.each do |k,v|
            init += v if c == k
        end
    end
    digit_sum(init)
  end

  def valid_date?(str)
    valid_formats = [/\d{2}\.\d{2}\.\d{4}/, /\d{2}\/\d{2}\/\d{4}/, /\d{2}-\d{2}-\d{4}/, /\d{4}-\d{2}-\d{2}/]
    check_format = valid_formats.map { |f| f.match?(str) && 1 || 0}.reduce(0,:+)
    raise ArgumentError.new("Incorrect date format") if check_format.zero?
  end

  def valid_hash?(h)
    raise ArgumentError.new("Object must me a Hash") unless h.is_a? Hash
    raise ArgumentError.new("Hash can not be empty") unless h.empty? true

  end

end
