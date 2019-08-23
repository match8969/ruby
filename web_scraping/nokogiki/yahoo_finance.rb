# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

require 'uri'



# 営業キャッシュフロー
# https://finance.yahoo.com/quote/TICKERSIMBOL/cash-flow?p=TICKERSIMBOL
# https://finance.yahoo.com/quote/ROKU/cash-flow?p=ROKU

# 純利益
# https://finance.yahoo.com/quote/TICKERSIMBOL/cash-flow?p=TICKERSIMBOL
# https://finance.yahoo.com/quote/ROKU/cash-flow?p=ROKU

# 売上高
# https://finance.yahoo.com/quote/TICKERSIMBOL/financials?p=TICKERSIMBOL
# https://finance.yahoo.com/quote/ROKU/financials?p=ROKU



# Total Cash Flow From Operating Activities : 営業キャッシュフロー
def get_tcfo(ticker_symbol)

end

# Net Income : 純利益
def get_net_income(ticker_symbol)

end

# Total Revenue : 売上高
def get_total_revenue(ticker_symbol)
end


# scraping
def scraping_yahoo_finance(ticker_symbol)
  # スクレイピング先のURL
  root_yahoo_finance_url = 'https://finance.yahoo.com/'

  cashflow_url = "#{root_yahoo_finance_url}/quote/#{ticker_symbol}/cash-flow?p=#{ticker_symbol}"
  financial_url = "#{root_yahoo_finance_url}/quote/#{ticker_symbol}/financials?p=#{ticker_symbol}"

  # 営業キャッシュフロー & 純利益
  charset = nil
  html = open(cashflow_url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end
  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  # タイトルを表示
  puts "cash_flow : #{doc.title}" # OK : "Roku, Inc. (ROKU) Cash Flow"

  # -------------------- #
  # 営業キャッシュフロー & 純利益
  charset = nil
  html = open(financial_url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end
  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  # タイトルを表示
  puts "cash_flow : #{doc.title}" # OK : Roku, Inc. (ROKU) Income Statement

end


# main
ticker_symbol = 'roku'
scraping_yahoo_finance(ticker_symbol)
