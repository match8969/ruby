
require 'benchmark'

# パターン1
# result = Benchmark.realtime do
#   # 処理
# end
# puts "処理概要 #{result}s"

# パターン2
# Benchmark.bm 10 do |r|
#   r.report "Nantoka" do
#     # (計測したい処理その1)
#   end
#   r.report "Kantoka" do
#     # (計測したい処理その2)
#   end
# end

puts "t" if true || false
puts "t" if false || true




require 'benchmark'


result = Benchmark.realtime do
  # 処理
  puts "test"
end
puts "処理概要 #{result}s"
