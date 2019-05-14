require 'opencv'
include OpenCV

# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
# html解析の読み込み
require 'uri'

# User Local Path
OUTPUT_DIR = "/Users/match/Desktop/GitHub/ruby/output/images"
OUTPUT_FILE_PREF = "example"

# Website
WEBSITE = 'https://inkphy.com/user/'

# inkphy
NAME = "selenagomez" # @xxxのインスタグラムのドメイン
REG_EXP_INKPHY_IMAGE = '//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style'

# スクレイピング先のURL
url = WEBSITE + NAME

# Htmlの取得
charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
p doc.title

# 画像保管先のURL格納用
img_paths = []

# 画像保管先のURL格納処理
doc.xpath(REG_EXP_INKPHY_IMAGE).each do |node|
  img_path = URI.extract(node.to_s.to_s.gsub!(/\);/, '') , ["https"])
  img_paths.push(img_path[0])
end

# 保存用ファイルネーム
output_name = "#{OUTPUT_DIR}/#{OUTPUT_FILE_PREF}"

# 保存先ファイルパス用
output_image_local_paths = []

# Webから画像を取得し、JPGとして保存
img_paths.each_with_index do |img_path, i|
  open(img_path) do |file|
    file_name = "#{output_name}_#{i}.jpg"
    open(file_name, "w+b") do |out|
      out.write(file.read)
    end
    output_image_local_paths.push file_name
  end
end

# Face detecter
# OpenCV : face detector の準備
data = "/Users/match/Desktop/GitHub/ruby/open_cv/xml/haarcascade_frontalface_alt.xml" #最新のxml
detector = CvHaarClassifierCascade::load(data)

# 検出後保存先
face_detect_output_name = "#{OUTPUT_DIR}/detect_#{OUTPUT_FILE_PREF}"

# 検出処理、および検出時のrectangle付き画像の保存
output_image_local_paths.each_with_index do |org_local_path, i|
  src_img = OpenCV::CvMat.load(org_local_path)
  detector.detect_objects(src_img).each do |region|
    detected_image = src_img.rectangle(region.top_left, region.bottom_right, :color => CvColor::Red, :thickness => 3)
    detect_file_name = "#{face_detect_output_name}_#{i}.jpg"
    detected_image.save detect_file_name
  end
end
