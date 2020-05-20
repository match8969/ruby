
# 引数の変数に代入したときに、その変数が直接破壊されるかどうかのテスト
# 結論 : 心配なし
test_str = "test"

def add_something(str)
  str = str.gsub(/t/, 'ch')
  str
end


puts "=="

puts " test_str : #{test_str}"

t_2 = add_something(test_str)

puts "t_2 : #{t_2}"
puts " test_str : #{test_str}"
