

reg_exp_amazon_sold_out_url = /https?:\/\/www\.amazon\.co\.jp\/s\?k=[^<>\s]*?&tag=.*?-22/

sold_out_url = 'https://www.amazon.co.jp/s?k=%28%E3%82%B6+%E3%83%8E%E3%83%BC%E3%82%B9%E3%83%95%E3%82%A7%E3%82%A4%E3%82%B9%29+THE&rh=p_89%3ATHE+NORTH+FACE%28%E3%82%B6%E3%83%8E%E3%83%BC%E3%82%B9%E3%83%95%E3%82%A7%E3%82%A4%E3%82%B9%29&tag=sl01tn-22'


r = sold_out_url.match(reg_exp_amazon_sold_out_url)
puts "r : #{r} ="
