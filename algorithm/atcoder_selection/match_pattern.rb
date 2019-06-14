# https://atcoder.jp/contests/abs
# ABC087B - Coins
a = 30 # 500
b = 40 # 100
c = 50 # 50
X = 6000

array = []
(0..a).map{ |x|
  (0..b).map{ |y|
    (0..c).map { |z|
      array.push(x*500+y*100+z*50)
    }
   }
  }

puts "array=#{array.count(X)}"
