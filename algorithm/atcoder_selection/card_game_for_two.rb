n = gets.to_i
cards = gets.split(" ").map(&:to_i)

alice_cards = []
bob_cards = []
cards.sort!.reverse!
alice_cards.push(cards.pop) if n.size%2 == 1

cards.map.with_index { |card, index|
   index%2 == 0 ? alice_cards.push(card) : bob_cards.push(card)
}
print "#{(alice_cards.inject(:+)-bob_cards.inject(:+)).abs}"
