require 'benchmark'
require 'bigdecimal/math'

LOWER_Z = 122
UPPER_Z = 90

def caesar(phrase, num)
  num = num % 26
  phrase = phrase.split("")
  phrase.map! do |x|
    if /[a-zA-Z]/ =~ x
      x.upcase == x ? upperCase = true : upperCase = false
      x = x.ord
      if upperCase && x + num > UPPER_Z || !upperCase && x + num > LOWER_Z
        x -= (26 - num)
        x = x.chr
      else
        (x += num).chr
      end
    else
      x = x.chr
    end
  end

  phrase = phrase.join("")
  puts "Caesar: #{phrase}"
end

caesar("mary had a little lamb", 5)
