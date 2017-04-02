dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
  word = word.downcase.split
  strings = {}
  dictionary.each do |ele|
    word.each do |word_ele|
      if word_ele.include?(ele)
        strings[ele] == nil ? strings[ele] = 1 : strings[ele] += 1
      end
    end
  end
  puts strings
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
