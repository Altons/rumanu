
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

end
