
require 'net/http'

# url = "http://smartlog.jp/"
url = "http://amzn.to/2qzfkt4"

uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
req = Net::HTTP::Get.new(uri.path)
response = http.request(req)

puts "response.code : #{response.code}"

puts "response.body : #{response.body}"

puts "response.value : #{response.value}"
