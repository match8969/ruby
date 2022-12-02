# Execute at ruby dir. Like "ruby % ".



def get_response_of(url)
    require 'net/http'
    require 'net/https'

    puts "aaaaaaa"

    puts ""

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

    puts "bbbbbbb"

    return url if res.nil?

    puts "res.code: #{res.code}"

    # 最大5回までリダイレクト先URLを探索する (RFC 1945)
    5.times do
        break unless res.code.match?(/30\d/)

        # リダイレクト先URLを設定
        redirected_url = res[:Location]

        puts "redirect_url : #{redirected_url}"

        unless redirected_url.start_with?(/http/)
            uri  = URI.parse(url)

            prefix = "#{uri.scheme}://#{uri.host}" # => "http://"

            puts "prefix: #{prefix}"
            puts "redirect_url: #{redirected_url}"

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
    # require "addressable/uri"
    require 'uri'


    # input_file_name = "web_search_result_test.csv"
    input_file_name = "a8_4c_short.csv"
    input_csv_path = "#{Dir.getwd}/data/csv/#{input_file_name}"

    # puts "#{input_csv_path}"

    # data_list = CSV.read(input_csv_path)
    # data_list.each do |url|
    #     puts "aaa"

    # end
    # p data_list

    # url = "https://px.a8.net/svt/ejp?a8mat=3NCU0O+4BZL9U+4OAC+BW0YB&a8ejpredirect=https%3A%2F%2Fwww.tigerbottles.com%2Fproducts%2Fmxv%3Foptions%3D4779924750473%252C500mL%252C39647231148169"

    # url = "https://www.tigerbottles.com/products/mxv?options=4779924750473%2C500mL%2C39647231148169&a8=3k7Hqk8V-OzU0_7PD5pnSBZ9U_cjz7za05z48OaTS46V-O7kRJ7ZzJ0Q91Slfl0z94g1TD7Z9k7HFs00000021810001"
    # url = "https://store.tiger-corporation.com/products/mxv?options=4779924750473%2C500mL%2C39647231148169&a8=3k7Hqk8V-OzU0_7PD5pnSBZ9U_cjz7za05z48OaTS46V-O7kRJ7ZzJ0Q91Slfl0z94g1TD7Z9k7HFs00000021810001"
    url = "https://store.tiger-corporation.com/products/mxv-e?a8=3k7Hqk8V-OzU0_7PD5pnSBZ9U_cjz7za05z48OaTS46V-O7kRJ7ZzJ0Q91Slfl0z94g1TD7Z9k7HFs00000021810001&options=4779924750473%2C500mL%2C39647231148169"
    terminal_url = get_terminal_url(url)

    puts "main(): terminal_url : #{terminal_url}"
end

main()

