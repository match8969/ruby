n, Y  = gets.split(" ").map(&:to_i)
(0..n).map { |x|
  (0..n-x).map { |y|
    z = n-x-y
    if x*10000+y*5000+z*1000 == Y
      print "#{x} #{y} #{z}"
      exit 0
    end
  }
}
print "-1 -1 -1"
