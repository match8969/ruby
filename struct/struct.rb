# https://docs.ruby-lang.org/ja/latest/class/Struct.html

dog = Struct.new("Dog", :name, :age)
fred = dog.new("fred", 5)
fred.age = 6
printf "name:%s age:%d", fred.name, fred.age
