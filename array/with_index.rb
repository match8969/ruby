# test

S = "test"
array_chars = S.chars
puts array_chars

array_chars.each.with_index do |c, i|
  print "c=#{c}, i=#{i}, " # c=t, i=0, c=e, i=1, c=s, i=2, c=t, i=3
end

puts "-----"

N = 5
N.times.with_index do |i|
  print "i = #{i}, " # i = 0, i = 1, i = 2, i = 3, i = 4,
end
