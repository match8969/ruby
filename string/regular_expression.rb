s = "of the people, by the people, for the people"
p s.scan(/\w+/)
p s.scan("people")

t = "101"
p t.scan("1").count

#  半角スペース区切り
s = "title desc url"
arr_s = s.split(" ")
puts "arr_s :  #{arr_s}"


arr_s2 = s.split(/\s/)
puts "arr_s2 :  #{arr_s2}"

array_s =  ["title", "desc", "url"]
# s_a = array_s.join(\s)
s_a = array_s.join("\s")
puts "s_a : #{s_a}"




s_a_sp = s.split("\s")
puts "s_a_sp : #{s_a_sp}"



# TEST
asin = "<test>creativeASIN=B000BT8TN0</test>"

reg_exp_asin = /creativeASIN.B.{9}/

puts "====="
puts "asin.match(reg_exp_asin) : #{asin.match(reg_exp_asin)}"
puts "asin.match() : #{asin.match(/creativeASIN.B.{9}/)}"


puts "end"


reg_exp_test = /.test./
tests = asin.match(reg_exp_test)
puts "tests[0] : #{tests[0]}"
puts "tests[1] : #{tests[1]}"
puts "tests: #{tests}"


object = "こんにちは　世界です。"
jouken = "こんにちは"
goku = "さようなら"
ob2 = object.gsub(/#{jouken}/,goku)
puts "ob2 : #{ob2}"




test_s = "test"

a_test_s = test_s.gsub(/t/,'\t' )

puts "test : #{test_s}"
puts "a_test_s : #{a_test_s}"


percent_s = "%t%"

a_percent_s = percent_s.gsub(/%/, '\%')

puts "percent_s : #{percent_s}"
puts "a_percent_s : #{a_percent_s}"


# tests

body = 'ブラックスーツに似合うマフラーです。黒スーツが栄えるのはカラフルな色使いのプリントマフラーだからこそ。マフラーの色味が野暮ったいブラックを、柔らかい遊びゴコロのある印象にしてくれます。

<a class="btn btn-default" href="http://www.amazon.co.jp/gp/product/B00HJ0MW9Q/ref=as_li_ss_tl?ie=UTF8&amp;camp=247&amp;creative=7399&amp;creativeASIN=B00HJ0MW9Q&amp;linkCode=as2&amp;tag=sl01tn-22">販売サイトで購入</a>

<a class="btn btn-default" href="https://www.amazon.co.jp/s?k=%5B%E3%82%B0%E3%83%83%E3%83%81%5D+%E8%85%95%E6%99%82%E8%A8%88+1500&rh=n%3A333010011%2Cp_89%3AGUCCI%28%E3%82%B0%E3%83%83%E3%83%81%29&tag=sl01tn-22">販売サイトで購入</a>

&nbsp;

【参考記事】シックで格好いい<strong>ブラックスーツのコーデ術</strong>を徹底レクチャー▽
<div class="og-link"><a class="og-link-href" href="https://smartlog.jp/42593"><span class="og-link-img"><img src="https://smartlog-stat2.imgix.net/wp-content/uploads/2017/03/16154649/wsi-imageoptim-shutterstock_531511795-1.jpg?w=200&fit=crop&auto=compress&q=25" alt="" /></span><span class="og-link-content-box"><span class="og-link-title">ブラックスーツの麗しい着こなし。大人の男のコーディネート術｜Smartlog</span><span class="og-link-site">Smartlog</span><span class="og-link-description">ブラックスーツを華麗に着こなせる“本物の男”になるために、黒スーツの麗しい着こなし方をお教えします。</span></span></a></div>

&nbsp;
<h3>6. PRADA (プラダ)</h3>'


# match = body.match(/href="http:\/\/www\.amazon\.co\.jp\/s\?k=.*"/) # TODO: ここの正規表現を確認
match = body.match(/href=\"http.*amazon.co.jp\/s\?k=/)

puts "match : #{match}"







url = 'https://www.amazon.co.jp/Anker-Bluetooth4-0-24%E6%99%82%E9%96%93%E9%80%A3%E7%B6%9A%E5%86%8D%E7%94%9F%E5%8F%AF%E8%83%BD%E3%80%90%E3%83%87%E3%83%A5%E3%82%A2%E3%83%AB%E3%83%89%E3%83%A9%E3%82%A4%E3%83%90%E3%83%BC-%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%AC%E3%82%B9%E3%82%B9%E3%83%94%E3%83%BC%E3%82%AB%E3%83%BC-A3102011/dp/B016XKHLCK?psc=1&amp;SubscriptionId=AKIAJUSP4YZBXJNE2YFA&amp;tag=sl01tn-22&amp;linkCode=xm2&amp;camp=2025&amp;creative=165953&amp;creativeASIN=B016XKHLCK'
sold_out_url = 'https://www.amazon.co.jp/s?k=Anker+Soundcore+%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%96%E3%83%AB&rh=n%3A85396051%2Cp_89%3AAnker&tag=sl01tn-22'
a_tag = '<a class="btn btn-default" href="https://www.amazon.co.jp/s?k=Anker+Soundcore+%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%96%E3%83%AB&rh=n%3A85396051%2Cp_89%3AAnker&tag=sl01tn-22">販売サイトで購入</a>'

a = '<a'
btn = 'btn'
href = 'href'
href_dq = 'href="'
https = 'https'
https_dq = '"https'
amazon = 'amazon'
https_amazon = 'https://www.amazon.co.jp'

sold_out_url_test = 'https://www.amazon.co.jp/s?k=Anker+Soundcore+%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%96%E3%83%AB&rh=n%3A85396051%2Cp_89%3AAnker&tag=sl01tn-22'


puts "= sold_out_url_test :#{sold_out_url_test}"

sold_out_url.gsub!(/\?/, '\?').gsub!(/\+/, '\\\\+')

sold_out_url_test.gsub!(/\?/, '\?')
puts "== sold_out_url_test :#{sold_out_url_test}"
# sold_out_url_test.gsub!(/\+/, '\\+') # NG:  + が消える
# sold_out_url_test.gsub!(/\+/, '\\\+') # OK
sold_out_url_test.gsub!(/\+/, '\\\\+') # OK


puts "=== sold_out_url_test :#{sold_out_url_test}"

puts "before :a_tag : #{a_tag}"
# a_tag.gsub!(/#{sold_out_url_test}/, url)
a_tag.gsub!(/#{sold_out_url}/, url) # NG

puts "after: a_tag : #{a_tag}"


####
reg_exp_direct_url = /^http/

puts "==="
puts url.match?(reg_exp_direct_url)
puts a_tag.match?(reg_exp_direct_url)


puts "========="

t_str = "TIFFANY&amp;CO.(ティファニー）オープンハート ..."
puts "<b> t_str : #{t_str}"
t_str.gsub!(/&amp;/, '&')
puts "<a> t_str : #{t_str}"
