# Words within Words
# Given an array of unique words, find the word that contains the greatest number of other words. 
# A word must be at least two letters long.

require "open-uri"

url = "http://www.joereynoldsaudio.com/enable1.txt"
open(url).read

local_fname = 'shout.rb'
File.open(local_fname, "w") { |file| file.write(open(url).read)}
File.open(local_fname, "r") do |file|
   file.readlines.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
end   

# the above loaded the file inside sublime

# Ruby solution 

# wordList = [ "Gray", "Grays", "Ray", "Rays", "Strays" ]

# freq = wordList.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
# => {"Gray"=>1, "Grays"=>1, "Ray"=>1, "Rays"=>1, "Strays"=>1}

# wordList.max_by {|w| freq[w]}
# => "Gray"




# JS solution
# function nestedWordCount (wordList) {
#   var maxnum = 0;
#   var max
#   var counts = {};
#   for (i = 0; i < wordList.length; i++) {
#       var contains = 0;
#       for (j = 0; j < wordList.length; j++) {
#           if (wordList[j].length > wordList[i].length) {
#               continue;
#           } else if (wordList[j].length === wordList[i].length) {
#               continue;
#           } else if (wordList[i].toLowerCase().match(wordList[j].toLowerCase())) {
#               contains += 1;
#           }
#       }
#       counts[wordList[i]] = contains;
#       contains = 0;
# }
# for (var key in counts) {
#     if (counts[key] > maxnum) {
#         maxnum = counts[key]
#         max = key;
#     }
#     }
#     return max
# }

# http://pastie.org/9768276#1
# http://www.reddit.com/r/dailyprogrammer/comments/2nihz6/20141126_challenge_190_intermediate_words_inside/
# http://ruby.bastardsbook.com/chapters/io/

words = File.read('/Users/tapwater/Downloads/enable1.txt').split
valid = Hash[words.zip [1].cycle]

puts "go"

long = words.select { |w| w.size > 12 }
puts long.max_by { |w|
  n = 0
  (0..w.size - 2).each do |s|
    (2..w.size - s).each do |e|
      n += 1 if valid[w[s, e]]
    end
  end
  puts n if n > 38
  n
}