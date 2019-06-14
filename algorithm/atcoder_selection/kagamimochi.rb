n = gets.to_i
mochies = []
n.times { mochies.push(gets.to_i) }
print "#{mochies.uniq.count}\n"
