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

#Synthesize
puts "\n\n\n"
books =  ["Design of Arts","Anathem","Shogun"]
authors = ["Bruno Munari","Neal Stephenson","James Clavell"]

newAuthors = []
authors.each do |x|
  newAuthors.push(x.split[0])
end

for myauthors in newAuthors
  for book in books
    puts ":#{myauthors.to_sym.downcase} => #{book}"
  break
  end
end
