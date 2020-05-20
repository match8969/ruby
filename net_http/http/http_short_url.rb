

# def get_redirect_url(short_url)
#     require 'net/http'
#     require 'net/https'
#
#     uri = URI.parse(short_url)
#     http = Net::HTTP.new(uri.host, uri.port)
#     req = Net::HTTP::Get.new(uri.path)
#     res = http.request(req)
#
#     # TODO: bodyタグに href=""の形ではいっている。抽出する正規表現を追加
#     reg_exp_href_asin_dp = /href="[^<>]*\/dp\/#{i.asin}.*?"/ # TODO: dp以外にredirectされないか確認
#     res.to_s.match(reg_exp_href_asin_dp).to_s
# end
#
#
# require 'net/http'
# require 'net/https'
#
# # short_url = 'http://amzn.to/2oql2cZ' # B0083RQI0S
# short_url = 'http://bit.ly/2NqJGYY'
# tag_short_url = 'href="http://amzn.to/2oql2cZ"' # B017Q2KZA4
# tag_short_urls = '<a href="http://amzn.to/2oql2cZ"></a><a href="http://amzn.to/2saIBdV"></a>'
#
# # url = URI.parse('http://www.example.com/index.html')
# # url = URI.parse(short_url)
# # req = Net::HTTP::Get.new(url.path)
# # res = Net::HTTP.start(url.host, url.port) {|http|
# #   http.request(req)
# # }
# # puts res.body
#
#
# uri = URI.parse(short_url)
# http = Net::HTTP.new(uri.host, uri.port)
# req = Net::HTTP::Get.new(uri.path)
# res = http.request(req)
# puts res.header
# puts res.body
#
#
# # <html>
# # <head><title>Bitly</title></head>
# # <body><a href="https://www.amazon.co.jp/プラダを着た悪魔-特別編-DVD-アン・ハサウェイ/dp/B0083RQI0S/ref=as_li_ss_tl?ie=UTF8&amp;linkCode=sl1&amp;tag=sl01tn-22&amp;linkId=96336b7c731923e3ba53b53a55d427f3">moved here</a></body>
# # </html>
#
# r = short_url.match?(/amzn\.to/)
# puts "r : #{r}"
#
#
#
#
# reg_exp_amazon_short = /http:\/\/amzn\.to\/[a-zA-Z0-9]{7}/
# # short_urls = short_url.scan(reg_exp_amazon_short) # OK
# # short_urls = tag_short_url.scan(reg_exp_amazon_short) # OK
# short_urls = tag_short_urls.scan(reg_exp_amazon_short)
#
#
#
# short_urls.each do |su|
#   puts "su : #{su}"
#
#   uri = URI.parse(su)
#   http = Net::HTTP.new(uri.host, uri.port)
#   req = Net::HTTP::Get.new(uri.path)
#   res = http.request(req)
#
#   puts "=== res.body : #{res.body} ==="
#
#   # TODO: bodyタグに href=""の形ではいっている。抽出する正規表現を追加
#   reg_exp_href_asin_dp = /href="[^<>]*\/dp\/[A-Z0-9]{10}.*?"/ # TODO: dp以外にredirectされないか確認
#   redirect_url = res.body.to_s.match(reg_exp_href_asin_dp).to_s
#
#   puts "redirect_url : #{redirect_url}"
# end
#
#
#
#
#
#
#
# require 'net/http'
#     require 'net/https'
#     uri = URI.parse(short_url)
#     http = Net::HTTP.new(uri.host, uri.port)
#     req = Net::HTTP::Get.new(uri.path)
#     res = http.request(req)
#     reg_exp_href_asin = /href="[^<>]*\/[A-Z0-9]{10}.*?"/
#     redirect_url = res.body.to_s.match(reg_exp_href_asin).to_s
#     redirect_url.gsub!(/href=/, '').gsub!(/"/, '')  if redirect_url.present?
#     puts "==== redirect_url : #{redirect_url}  ==="
#     redirect_url
#
# 


short_url = 'http://bit.ly/2NqJGYY'
