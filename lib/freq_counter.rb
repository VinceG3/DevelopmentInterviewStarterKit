module FreqCounter
  def self.count_uniques(array_of_strings)
    chars = array_of_strings.join('').chars
    uniq = chars.uniq
    return uniq.map{|c| { c => chars.count(c) }}
               .sort{|a, b| b.values.first <=> a.values.first }
               .inject(:merge)
  end
end