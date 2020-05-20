
# concatの実行側、対象側がnilのときを検証

array_a = [1, 2, 3]
array_b = [4, 5, 6]
array_a_nil = []
array_b_nil = []


# ありあり
# puts "A: #{array_a.concat(array_b)}"

# #　ありなし
# puts "B: #{array_a.concat(array_b_nil)}"
# # なしあり
puts "C: #{array_a_nil.concat(array_b)}"
# #　なしなし
# puts "D: #{array_a_nil.concat(array_b_nil)}"
