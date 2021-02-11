=begin

  Allan Alexander
  3:49 pm
  Thursday 11th February 2021

  Topic: Arrays
  Important:
      ".length" to get the length of array
      ".push()" to add element into an array
      ".last" to get the last elemet in an array

=end

books = ["Shogun", "Attack on Titans", "One Piece"]

puts "#{books}"
puts " #{books.length}"
puts " #{books[0]}"

# add into an array
books.push("Death Note")
puts "#{books}"

#last element of an array
puts books.last
puts "\n"

#Accessing Elements
arr = [1,2,3,4,5,6] # Array.new(6) {|i| i}
puts arr[2]    # => 3
puts arr[100]  # => nil
puts arr[-3]   # => -3
puts arr[2,3]  # => 4
puts arr[1..4] # => [2,3,4,5]
puts arr[1..-3]# => [2,3,4]
