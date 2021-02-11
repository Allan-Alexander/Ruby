Library = {
  "rowling" => "Harry Potter",
  "lahiri"  => "Interpreter of Maladies"
}

puts Library["lahiri"]

library = {}
library["austen"] = ["Pride and Prejudice","Sense and Sensibility"]
library["asimov"] = ["Robert of Dawn","I, Robot"]

authors = library.keys
p "These are the authors in my catalog: #{authors.join(',')}"

library.each do |author,books|
  puts "#{author.capitalize} wrote the books #{books.join(',')}"
end

# Symbols are similar to Strings
a = :name
p a

# Enclose multiword symbols in double quotes
c = :"multiple words"
p c
