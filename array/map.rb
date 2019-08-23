
array = []
out = "test"


# out += array.map {
#   |a|
# }

out += array.map{ |a|} unless array.blank?

puts out
