# @see https://tiagoamaro.com.br/2016/08/27/ruby-2-3-dig/

require 'benchmark/ips'

Benchmark.ips do |x|
  example_hash  = { a: { b: { c: 3 } } }
  example_array = [1, [2, [3]]]

  x.report("Hash#dig found")             { example_hash.dig(:a, :b, :c) }
  x.report("Hash#dig not found")         { example_hash.dig(:a, :b, :foo, :bar) }
  x.report("Hash navigation found")      { example_hash[:a][:b][:c] }
  x.report("Hash navigation not found")  { example_hash[:a][:b][:d] }

  x.report("Array#dig found")            { example_array.dig(1, 1, 0) }
  x.report("Array#dig not found")        { example_array.dig(1, 1, 1, 1) }
  x.report("Array navigation found")     { example_array[1][1][0] }
  x.report("Array navigation not found") { example_array[1][1][1] }

  x.compare!
end
