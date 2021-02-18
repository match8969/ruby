

non_escape_str = "https://hb.afl.rakuten.co.jp/hgc/g0000016.smrrcc7e.g0000016.smrrdb6a/?pc=https%3A%2F%2Fproduct.rakuten.co.jp%2Fproduct%2F-%2Fa1004ddd1cf0b8d54634c42796f776d5%2F&m=http%3A%2F%2Fm.product.rakuten.co.jp%2Fproduct%2Fa1004ddd1cf0b8d54634c42796f776d5%2F"

tag_non_escape_str =  "<a href='#{non_escape_str}'>テスト</a>"


# 楽天市場
reg_exp_product_item = /http?s:\/\/hb\.afl\.rakuten\.co\.jp\/hgc\/.*?\/\?pc=https.*?product\.rakuten\.co\.jp.*?product.*?-.*?(%2F)/


arr = tag_non_escape_str.scan(reg_exp_product_item)


puts "ssssss"
puts "arr: #{arr.class}"
