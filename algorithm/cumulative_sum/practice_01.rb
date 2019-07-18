# https://atcoder.jp/contests/abc122/tasks/abc122_c
# 入力の所得
N, Q = gets.split(" ").map(&:to_i)
S = gets.chomp!
s_cs = S.chars



# 累積和用のarray
cumulative_sums = Array.new(N+1, 0)

# 文字列の長さで回す
N.times.with_index do |i| # i = 0, i < N, i ++1
  # 最後の文字を覗いて 'A'であること && 　同時に i+1 が 'C'である条件
  if (i+1 < N && s_cs[i]  == 'A' ) && (s_cs[i+1] == 'C')
    cumulative_sums[i+1] = cumulative_sums[i] + 1
  end
    cumulative_sums[i+1] = cumulative_sums[i]
end

# クエリ
Q.times do
  l, r = gets.split(" ").map(&:to_i)
  puts "#{cumulative_sums[r+1] - cumulative_sums[l+1]}"
end
