# Ruby String test

puts "test: string ruby"

#
puts "#{'a'*20}" # aaaaaaaaaaaaaaaaaaaa

puts "#{Time.now.month}"



10.times do |n|
  puts n
end


# encode
require 'uri'
s = "["
puts "s : #{s}"
puts "s.encode('UTF-8') : #{s.encode('UTF-8')}"
puts "URI.encode(s) : #{URI.encode(s)}"
