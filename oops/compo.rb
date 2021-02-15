class Student

  #Constructor
  def initialize(id, name)
    @id    = id
    @name  = name
  end

  #Getter
  def name
    return @name
  end

  #Getter
  def id
    return @id
  end

end


class Course
  def initialize(courseName, student)
    @courseName = courseName
    @student = student
  end

  def enroll(new_student)
    @student.push(new_student)
    return @student.last.name
  end


  def getStudentById(roll_no)
    @student.find{|student| student.id == roll_no}
  end

  def enrolled?(roll_no)
    @student.any?{|student| student.id == roll_no}
  end

end

saas = Course.new("SaaS 201",[
  Student.new(715,"Raj"),
  Student.new(716,"Sai")
])

puts saas.enroll(Student.new(717,"Zen"))
puts saas.enrolled?(717)
puts saas.enrolled?(515)

puts saas.enroll(Student.new(800,"Ned"))
puts saas.enrolled?(800)

puts saas.getStudentById(800).name
