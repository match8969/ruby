# test
numbers1 = [3, 5, 3, 1, 4, 7]
numbers2 = [2, 6, 8, 3, 7, 1]
p numbers1 & numbers2




a = []
b = []
p a & b
p 'a&b if' if (a & b).empty?

if a&b
  puts 'true'
else
  puts 'false'
end


c = [1]
puts a&c
if a&c
  puts 'a&c true'
else
  puts 'a&c false'
end
p 'a&c if' if (a & c).empty?

d = [2]
puts c&d
if c&d
  puts 'c&d true'
else
  puts 'c&d false'
end
p 'c&d if' if (c & d).empty?
#p 'c&d if' if (c & d).exist?

#puts (a & b)
