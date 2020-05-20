require 'amazon/ecs'

Amazon::Ecs.configure do |options|
  # このaccess_keyとsecret_keyは、associate画面から取得できるkeyを使う
  # 適当に環境変数にしてあげてください
  options[:AWS_access_key_id] =
  options[:AWS_secret_key] = 
  options[:associate_tag] = match8969-22
end

class SearchAmazon
  def search_book
    Amazon::Ecs.debug = true
    books = Amazon::Ecs.item_search(
        "サピエンス全史",
        search_index: 'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )
  end
end

amazon = SearchAmazon.new
res = amazon.search_book
if res.has_error?
  p "エラー発生"
end
first_book = res.items.first
#URlを取得
p first_book.get('DetailPageURL')
# imageリンクを取得
# SmallImage
# MediumImage
# LargeImage
# など、様々な種類のimageを取得できる
p first_book.get_hash('MediumImage')
