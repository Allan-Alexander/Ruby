=begin

   Allan Alexander
   3:21 pm
   Friday, 12th February 2021

   Topic: Class in Ruby
     Important:
        Class name starts with caps.
=end


# ******* Class *********

class Student

  #Constructor
  def initialize(roll_no, name)
    @roll_no     = roll_no
    @name        = name
    @is_enrolled = false
  end

  #Setter
  def enroll
    return  @is_enrolled = true
  end

  #Getter
  def is_enrolled?
    return @is_enrolled
  end

  #Getter
  def name
    return @name
  end

  #Getter
  def roll_no
    return @roll_no
  end


end

student = Student.new(715,"Raj")
p student.enroll

# ******* Class *********

# ******* Person Class *******
class Person

  #Contructor
  def initialize(firstName, lastName)
    @firstName = firstName
    @lastName  = lastName
    @person = []
  end

  #Grettings Method
  def grettings()
    return "Welcome #{@firstName.capitalize} #{@lastName.capitalize}"
  end

  #Setter
  def newPerson(firstName, lastName)
    @firstName = firstName
    @lastName  = lastName
  end

  #Add to an array of persons
  def addPerson(person)
    @person.push(person)
  end

end

Tom = Person.new("Tom","Sawyer")
puts Tom.grettings()
Tom.newPerson("Percy","Jackson")
puts Tom.grettings()
p Tom.addPerson(["Allan Alexander","Michel"])


#********* Person ***********
