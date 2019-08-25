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


# definition
# REG_EXP_CASH_FLOW = '//span' # これだとフッターのとかで reactidが重複する可能性ある。。。
REG_EXP_CASH_FLOW = '//div[@id="render-target-default"]//div[@data-reactid="1"]//div[@data-reactid="25"]//span' # 成功: TODO: reactid に頼らないで class とかで指定できたい。

REG_EXP_FINANCIAL = '//span[@data-reactid="126"]'
# REG_EXP_INKPHY_IMAGE = '//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style'


# Period Ending
REG_EXP_PERIOD_ENDING_TITLE=30
REG_EXP_PERIOD_ENDING_PQ_ONE=32
REG_EXP_PERIOD_ENDING_PQ_TWO=34
REG_EXP_PERIOD_ENDING_PQ_THREE=36
REG_EXP_PERIOD_ENDING_PQ_FOUR=38

# 純利益
REG_EXP_NET_INCOME_TITLE=41
REG_EXP_NET_INCOME_PQ_ONE=43
REG_EXP_NET_INCOME_PQ_TWO=45
REG_EXP_NET_INCOME_PQ_THREE=47
REG_EXP_NET_INCOME_PQ_FOUR=49

# 営業キャッシュフロー
REG_EXP_TCFO_TITLE=121
REG_EXP_TCFO_PQ_ONE=123
REG_EXP_TCFO_PQ_TWO=125
REG_EXP_TCFO_PQ_THREE=127
REG_EXP_TCFO_PQ_FOUR=129



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
    cashflow_html = open(cashflow_url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    cashflow_doc = Nokogiri::HTML.parse(cashflow_html, nil, charset)

    # タイトルを表示
    puts "cash_flow : #{cashflow_doc.title}" # OK : "Roku, Inc. (ROKU) Cash Flow"

    # -------------------- #
    # 売上高
    charset = nil
    financial_html = open(financial_url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    financial_doc = Nokogiri::HTML.parse(financial_html, nil, charset)

    # タイトルを表示
    puts "Financial : #{financial_doc.title}" # OK : Roku, Inc. (ROKU) Income Statement



    # 解析
    puts "----- cash flow test -----"

    # 決算の日付の取得
    period_title = ""
    period_date_pre_q1 = ""
    period_date_pre_q2 = ""
    period_date_pre_q3 = ""
    period_date_pre_q4 = ""

    # 純利益の取得
    net_income_title = ""
    net_income_pre_q1 = ""
    net_income_pre_q2 = ""
    net_income_pre_q3 = ""
    net_income_pre_q4 = ""

    # 営業キャッシュフローの取得
    tcfo_title = ""
    tcfo_pre_q1 = ""
    tcfo_pre_q2 = ""
    tcfo_pre_q3 = ""
    tcfo_pre_q4 = ""

    cashflow_doc.xpath(REG_EXP_CASH_FLOW).each do |node|


      puts "node = #{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_TITLE}\"/) # period Ending

     #      # 決算の日付の取得
            period_title = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_TITLE}\"/)
            period_date_pre_q1 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_PQ_ONE}\"/)
            period_date_pre_q2 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_PQ_TWO}\"/)
            period_date_pre_q3 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_PQ_THREE}\"/)
            period_date_pre_q4 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_PERIOD_ENDING_PQ_FOUR}\"/)


            # 純利益の取得
            net_income_title = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_NET_INCOME_TITLE}\"/)
            net_income_pre_q1 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_NET_INCOME_PQ_ONE}\"/)
            net_income_pre_q2 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_NET_INCOME_PQ_TWO}\"/)
            net_income_pre_q3 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_NET_INCOME_PQ_THREE}\"/)
            net_income_pre_q4 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_NET_INCOME_PQ_FOUR}\"/)

            # 営業キャッシュフローの取得
            tcfo_title = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_TCFO_TITLE}\"/)
            tcfo_pre_q1 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_TCFO_PQ_ONE}\"/)
            tcfo_pre_q2 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_TCFO_PQ_TWO}\"/)
            tcfo_pre_q3 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_TCFO_PQ_THREE}\"/)
            tcfo_pre_q4 = "#{node.text}" if node.to_s.match(/.*?data-reactid=\"#{REG_EXP_TCFO_PQ_FOUR}\"/)



     #      puts "日付 Title : #{node.text}" if node.to_s.include?("30")
     #      puts "日付 A : #{node.text}" if node.to_s.include?("32")
     #      puts "日付 B : #{node.text}" if node.to_s.include?("34")
     #      puts "日付 C : #{node.text}" if node.to_s.include?("36")
     #      puts "日付 D : #{node.text}" if node.to_s.include?("38")
     #
     #   # 純利益
     #     puts "純利益 Title : #{node.text}" if node.to_s.include?("41")
     #     puts "Income カラム1 = #{node.text}" if node.to_s.include?("43")
     #     puts "Income カラム2 = #{node.text}" if node.to_s.include?("45")
     #     puts "Income カラム3 =  #{node.text}" if node.to_s.include?("47")
     #     puts "Income カラム4 = #{node.text}" if node.to_s.include?("49")
     #
     #   # 営業キャッシュフロー
     #      # 数値の取得
     #      # TODO: idの決めうちを解決したい。 (total cash flow の文字を確認したらそのid を取得して, そのid +2とかそんなかんじに。)
     #      puts "営業キャッシュフロー Title : #{node.text}" if node.to_s.include?("121")
     #      puts "Cash Flow カラム1 = #{node.text}" if node.to_s.include?("123")
     #      puts "Cash Flow カラム2 = #{node.text}" if node.to_s.include?("125")
     #      puts "Cash Flow カラム3 = #{node.text}" if node.to_s.include?("127")
     #      puts "Cash Flow カラム4 = #{node.text}" if node.to_s.include?("129")
     # end
     #
   end

   # test
   puts "日付"
   puts "period_title : #{period_title}"
   puts "period_date_pre_q1 : #{period_date_pre_q1}"
   puts "period_date_pre_q2 : #{period_date_pre_q2}"
   puts "period_date_pre_q3 : #{period_date_pre_q3}"
   puts "period_date_pre_q4 : #{period_date_pre_q4}"

   puts "純利益"
   puts "net_income_title : #{net_income_title}"
   puts "net_income_pre_q1 : #{net_income_pre_q1}"
   puts "net_income_pre_q2 : #{net_income_pre_q2}"
   puts "net_income_pre_q3 : #{net_income_pre_q3}"
   puts "net_income_pre_q4 : #{net_income_pre_q4}"

   puts "営業キャッシュフロー"
   puts "tcfo_title : #{tcfo_title}"
   puts "tcfo_pre_q1 : #{tcfo_pre_q1}"
   puts "tcfo_pre_q2 : #{tcfo_pre_q2}"
   puts "tcfo_pre_q3 : #{tcfo_pre_q3}"
   puts "tcfo_pre_q4 : #{tcfo_pre_q4}"




   puts "----- financial test -----"

 financial_doc.xpath(REG_EXP_FINANCIAL).each do |node|
   puts "most recent node = #{node.text}" if node.include?("123")

 end

puts "----- test -----"

end


# main
ticker_symbol = 'roku'
scraping_yahoo_finance(ticker_symbol)
