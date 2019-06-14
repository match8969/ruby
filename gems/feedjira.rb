require 'feedjira'

Feedjira.logger.level = Logger::FATAL # 不要なlogがでるので。

sites = [
  # 藤原竜也
  "https://www.google.com/alerts/feeds/15649911401049326039/9747006319245962646"
]

puts "--- start"

@list = []
sites.each do |site|
  rss = Feedjira::Feed.fetch_and_parse site
  rss.entries.each do |item|
    @list += [
      :id => item.id,
      :title => item.title
    ]
  end
end

puts "middle"

# とれてる。 puts @listの場合のみ文字化け
# @list.each do |l|
#   puts l[:title]
# end

puts "--- end"
