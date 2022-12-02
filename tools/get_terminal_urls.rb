# Execute at ruby dir. Like "ruby % ".

def get_response_of(url)
    require 'net/http'
    require 'net/https'

    begin
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        if  url.start_with?("https")
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        http.start { http.get(uri.request_uri) }
    rescue => error
        puts error
    end

end

def get_terminal_url(url)

    res = get_response_of(url)

    return url if res.nil?

    # 最大5回までリダイレクト先URLを探索する (RFC 1945)
    5.times do
        break unless res.code.match?(/30\d/)

        # リダイレクト先URLを設定
        redirected_url = res[:Location]

        unless redirected_url.start_with?(/http/)
            uri  = URI.parse(url)
            prefix = "#{uri.scheme}://#{uri.host}"
            redirected_url = prefix + redirected_url
        end

        url = redirected_url

        res = get_response_of(url)

        break if res.nil?
    end

    url
end

def main
    require "csv"
    require 'uri'

    # input_file_name = "a8_4c_more_short.csv"
    input_file_name = "a8_4c.csv"
    input_csv_path = "#{Dir.getwd}/data/csv/#{input_file_name}"


    # CSV読み込み
    data_list = CSV.read(input_csv_path)
    
    # CSV生成
    output_file_name = "#{Time.now.strftime("%Y%m%d_%H%M%S")}.csv"
    output_file_path = "#{Dir.getwd}/output/csv/#{output_file_name}"
    CSV.open(output_file_path, "wb") do |csv|
        csv << [  "元URL", "たどり着くURL"]

        data_list.each do |list|

            url = list[0]
            unless url.start_with?(/http/)
                next
            end

            terminal_url = get_terminal_url(url)
            csv << [ "#{url}", "#{terminal_url}"]
        end
    end


    puts "かんりょう"
    puts "open #{output_file_path}"
    
end

main()

