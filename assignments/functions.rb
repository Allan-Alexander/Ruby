recipients = [
  ["Srinath"],
  ["Jadeja","Kambli"],
  ["Sachin","Sidhu","Kumble"]
]

def generate_salutation(names)
  if names.length == 1
    puts "Hello #{names[0]}!"
  elsif names.length == 2
    puts "Hello #{names[0]} and #{names[1]}"
  else
    puts "Hello #{names[0..-2].join(',')} and #{names.last}!"
  end
end

recipients.each do |x|
  generate_salutation(x)
end

# Synthesize
puts "\n\n\n"

def salute(name,sal)
  return "#{sal.capitalize} Mr.#{name.split.last.capitalize}"
end

puts salute("Nelson Rolihlahla Mandela","hello")
puts salute("Sir Allan Turing","welcome")
