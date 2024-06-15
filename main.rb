require_relative 'lib/linked_list'
require_relative 'lib/node'

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
puts list

list.prepend(0)
puts list

puts "Node at index 2 contains value: #{list.at(2).value}"

list.pop
puts list

puts list.contains?(0)
puts list.contains?(5)

puts "Value 1 is found at index: #{list.find(1)}"

list.insert_at(1.5, 2)
puts list

list.remove_at(2)
puts list
