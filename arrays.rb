=begin

  Allan Alexander
  3:49 pm
  Thursday 11th February 2021

  Topic: Arrays
  Important:
      ".length" to get the length of array

      ".push(element)" to add element into an array
      ".pop" to delete element from the end

      ".unshift(element)" to add elements at the beginning of the array
      ".shift" to remove element from the beginning

      ".insert(index, element)" to insert at a particular index
      ".delete_at(index)" delete from an index
      ".delete(2)" removes all the 2's from the array

      ".last" to get the last elemet in an array
      ".fetch(index, "err msg")" fetch from a array

      ".empty?" to check if the array is empty
      ".include?('Death Note')" return true if arr contains "Death Note"

      ".compact" to remove nil elements from array
      ".uniq" remove duplicates


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

# Accessing Elements
arr = [1,2,3,4,5,6] # Array.new(6) {|i| i}
puts arr[2]    # => 3
puts arr[100]  # => nil
puts "#{arr[-3]}"   # => -3
puts "#{arr[2,3]}"  # => 4
puts "#{arr[1..4]}" # => [2,3,4,5]
puts "#{arr[1..-3]}"# => [2,3,4]


# Accessing using fetch
# arr.fetch(100)
puts "#{arr.fetch(100,"oops ... does not exist")}"

# Return the first n elements.
puts "Take first 3 elements #{arr.take(3)}"

# Drop First 3 elements
p "After droping 3 elements #{arr.drop(3)}"


# .each (Transforming array)
nums = [2,4,200,400]
nums.each{|x| p "Number is : #{x}"}

new_nums = nums.map{|number| number*2}
p "#{new_nums}"


# Problems
# Join first name and last name

names = [["Jhumpa","Lahiri"],["J.K","Rowling"],["Devdutt","Patel"]]
fullName = []
names.each do |(x,y)|
  p "firstName: #{x}  LastName: #{y}"
  fullName.push(x+" "+y)
end
p fullName

# Authors and Books
puts "\n\n"
books = ["Design as Art","Anathem","Shogun"]
authors = ["Bruno Munari","Neal Stephson","James Clavell"]

for book in books
  for author in authors
    puts "#{book} was written by #{author}"
    authors.shift
    break
  break
  end
end

# Todo category
puts "\n\n"
todos = [
  ["Send invoice","money"],
  ["Clean room","organize"],
  ["Pay rent","money"],
  ["Arrange books","organize"],
  ["Pay taxes","money"],
  ["Buy grocerie","food"]
]

index = 0
newArr =  todos.sort_by {|a,b|b}

lastElement  = ""
newArr.each do |(x,y)|
  if y == lastElement
    puts " #{x}"
  else
    puts "#{y}:"
    puts " #{x}"
    lastElement = y
  end
end
