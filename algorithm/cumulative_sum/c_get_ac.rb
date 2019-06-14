# https://atcoder.jp/contests/abc122/tasks/abc122_c
N, Q = gets.split(" ").map(&:to_i)
S = gets.chomp!
s_cs = S.chars

# 累積和用のarray
cumulative_sums = Array.new(N+1, 0) # N+1 のarrayで 0で初期化

# 文字列の長さで回す
N.times.with_index do |i|
  if (i+1 < N && s_cs[i] == 'A' && s_cs[i+1] == "C")
    # "AC"があれば、累積和に値を加える 累積+1　として。[0, 1, 2, 3, 4 ..]
    cumulative_sums[i+1] = cumulative_sums[i] + 1
  else
    # ない場合は + 0 の累積を追加
    cumulative_sums[i+1] = cumulative_sums[i]
  end
end

# クエリ
Q.times.with_index do |i|
  l, r = gets.split(" ").map(&:to_i)
  # index のために 1をへらす
  l -= 1
  r -= 1
  print("#{cumulative_sums[r] - cumulative_sums[l]}\n")
end



# 解答
# int main() {
#     int N, Q; cin >> N >> Q;
#     string str; cin >> str;
#
#     // 累積和
#     vector<int> s(N+1, 0);
#     for (int i = 0; i < N; ++i) {
#         if (i+1 < N && str[i] == 'A' && str[i+1] == 'C') s[i+1] = s[i] + 1;
#         else s[i+1] = s[i];
#     }
#
#     // クエリ
#     for (int q = 0; q < Q; ++q) {
#         int l, r; cin >> l >> r;
#         --l, --r; // 0-indexed にする
#         cout << s[r] - s[l] << endl;
#     }
# }
