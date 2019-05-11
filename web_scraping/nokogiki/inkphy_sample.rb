

NAME = "selenagomez"

# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
# html解析の読み込み
require 'uri'


# スクレイピング先のURL
url = 'https://inkphy.com/user/'+ NAME

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
p doc.title
img_paths = []

doc.xpath('//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style').each do |node|
  #p node.text
  img_path = URI.extract(node.to_s, ["https"])
  img_path.to_s.gsub!(/\)/, '').gsub!(/\;/, '')
#  img_path = (URI.extract(node.to_s, ["https"]).to_s.gsub(')', '').gsub(';', ''))
  img_paths.push(img_path)

  # img_paths.each do |img_path|
  #
  #   p img_path
  # end
end
p img_paths.sample


#
# doc.xpath('//div[@class="item"]').each do |node|
# 	# タイトルを表示
# 	p node.css('h3').inner_text
# 	p node.css('img').attribute('src').value
# 	p node.css('a').attribute('href').value
#
#   node.xpath('//div[@class="item"]')
#   puts node[:href]
#
# end
