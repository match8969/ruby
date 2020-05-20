h = {
  res: {
    res_2: {
      res_3: {
        name: "tom"
      }
    }
  }
}
# puts "h : #{h}"

h.each do |r|
  puts "r : #{r}" # => r : [:res, {:res_2=>{:res_3=>{:name=>"tom"}}}]
  puts "r.class: #{r.class}" # => r.class: Array
  # r.each do |r_2|
  #   puts "r_2: #{r_2}"
  #   puts "r_2.class: #{r_2.class}"
  #   r_2.each do |r_3|
  #     puts "r_3: #{r_3}"
  #   end
  # end
end
