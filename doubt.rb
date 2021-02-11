Array({:a => "a", :b => "b"})

# => [[:a, "a"],[:b, "b"]]



# Usage ?

myArray = Array.new(4) {Hash.new}
puts "#{myArray}"


newArray = Array.new(4) {|i| i.to_s}
puts "#{newArray}"
