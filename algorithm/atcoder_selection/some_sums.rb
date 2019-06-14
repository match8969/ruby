n = 100
a = 4
b = 16
# 84

# 100 4 16
# 4554


# n, a, b = gets.split(" ").map(&:to_i)


# OK!!
nums = (1..n)
num_sums = 0
nums.map { |num|
  c_nums = num.to_s.chars.to_a
  sum = c_nums.map(&:to_i).inject(:+)
  if sum>=a && sum<=b
    num_sums += num.to_i
  end
}
print "#{num_sums}\n"
