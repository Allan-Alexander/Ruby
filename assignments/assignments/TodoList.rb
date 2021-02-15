require "date"

class Todo
  def initialize(text, due_date, completed)
    @text      = text
    @due_date  = due_date
    @completed = completed
  end

  def text
    @text
  end

  def due_date
    @due_date
  end

  def completed
    @completed
  end

  def overdue?
    if @due_date < Date.today
      return true
    else
      return false
    end
  end

  def due_today?
    if @due_date == Date.today
      return true
    else
      return false
    end
  end

  def due_later?
    if @due_date > Date.today
      return true
    else
      return false
    end
  end

  def to_displayable_string
    # Code here
  end
end

class TodoList
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodoList.new(@todos.filter {|todo|todo.overdue?})
  end

  def due_today
    TodoList.new(@todos.filter {|todo|todo.due_today?})
  end

  def due_later
    TodoList.new(@todos.filter {|todo|todo.due_later?})
  end

  def add(newTodo)
     @todos.push(newTodo)
  end

  # Fill code here
  def to_displayable_list
    dispArray = []
     for item in @todos
       date = item.due_date == Date.today ? ("") : (item.due_date)
       if item.completed == false
         dispArray.push("[] #{item.text} #{date}")
       else
         dispArray.push("[X] #{item.text} #{date}")
       end
     end
     return dispArray.join("\n")
  end

end

date = Date.today
todos = [
  {text: "Submit assignment", due_date: date-1, completed: false},
  {text: "Pay Rent", due_date: date, completed: true},
  {text: "File taxes", due_date: date+1, completed: false},
  {text: "Call Acme Corp", due_date: date+1, completed: false},
]

todos = todos.map{|todo|
   Todo.new(todo[:text],todo[:due_date],todo[:completed])
  }

todos_list = TodoList.new(todos)

todos_list.add(Todo.new("Service vehical", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"

puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
