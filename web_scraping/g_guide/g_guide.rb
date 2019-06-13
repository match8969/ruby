# Tips:
# nokogiri のrequireのエラーは rubyディレクトリにはいって
# gem install nokogiri
# でOK...


# TODO:
# うまく番組のタイトルと内容の一致をさせることができてない。
# テレビタイトルも 全角を削除のせいでサブタイトルとセットになっている
# どうにかHashをつかうとかで title => xxx, description => yyy にしたい予定


# test url
# https://tv.so-net.ne.jp/chart/23.action?head=201906120000&span=24&chartWidth=950&cellHeight=3&sticky=true&descriptive=true&buttonType=0

# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
# html解析の読み込み
require 'uri'


# test



# Website
# URL = "https://tv.so-net.ne.jp/chart/" 23.actionにリダイレクトされる
BASE_URL = "https://tv.so-net.ne.jp/chart/23.action"
QUERY ="head=#{Time.now.strftime("%Y%m%d")}0000" # https://tv.so-net.ne.jp/chart/23.action?head=201906130000

puts "QUERY=#{QUERY}"
search_url = "#{BASE_URL}?#{QUERY}"
puts "------"
# td-schedule
# - schedule-link
# - schedule-title
REG_EXP_GGUIDE = '//div[@class="chartColumn"]' #cell-schedule
REG_EXP_TITLE = '//span[@class="schedule-title"]'#'//span[@class="schedule-title"]/text()'
REG_EXP_SUMMARY = '//span[@class="schedule-summary"]/text()'#schedule-summary

puts "SERACH_URL=#{search_url}"
puts "------"

# Htmlの取得
charset = nil
html = open(search_url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
puts "doc.title=#{doc.title}"
# 6月 12日（Wed）の番組表
#     [東京 / 地上波 /
# 0-6時]
#  - Gガイド.テレビ王国

# 画像保管先のURL格納処理
doc.xpath(REG_EXP_GGUIDE).each_with_index do |node, i|

  node.xpath(REG_EXP_TITLE).each_with_index do |title_node, j|
    title_node_2 =title_node.to_s.gsub!(/<(.+?)>/, '').gsub!(/[[:space:]]/, '')
    puts "title_node=#{i}_#{j}_#{title_node_2}" # NHKニュースおはよう日本食品ロスに大手コンビニが対策
  end
  node.xpath(REG_EXP_SUMMARY).each_with_index do |summary_node, j|
    puts "summary_node=#{i}_#{j}_#{summary_node}"
  end

end
