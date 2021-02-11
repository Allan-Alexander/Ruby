=begin

  Allan Alexander
  2:57pm
  Thursday 11th Feb 2021

  Topic : Variables And Data Types
    Important: ".class" to get the type of data stored
                no class for Boolean. Its either TrueClass pr FalseClass
                "to_s" to convert from Int to String
                "to_f" to convert Int to Float
                no need to use "to_s" while using String interpolation "#{age}"

=end

count   = 100           # Holds Integer
course  = 'SaaS 2021'   # Holds String
is_live = false          # boolean
lessons = ['Basics', 'Intermediate', 'Advanced']

puts " #{count} \n #{course} \n #{is_live} \n #{lessons}"
puts "\n #{count.class} \n #{course.class} \n #{is_live.class} \n #{lessons.class}"

puts " Indexing from Array #{lessons[2]}"

# To String Method

age  = 21
name = "Allan Alexander".upcase
puts "\n I am #{name} and my age is #{age.to_s} old"

# To Float Method

nums = [5,10,15]
avg  = "#{ nums.sum / nums.length }".to_f
puts " The average is #{avg}"
