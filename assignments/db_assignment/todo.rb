require 'active_record'

class Todo < ActiveRecord::Base

  def due_today?
    due_in_days == Date.today
  end

  def overdue?
    due_in_days < Date.today
  end

  def completed?
    return completed ? false : true
  end

  def due_later?
    due_in_days > Date.today
  end

  def to_displayable_string(due = "toDisplay")

    display_status = completed ? "[X]" : "[]"
    if overdue? && due == "Overdue" || due == "toDisplay"
      puts "#{id}. #{display_status} #{todo_text} #{due_in_days}"
    elsif due_today? && due == "Due Today" || due == "toDisplay"
      puts "#{id}. #{display_status} #{todo_text}"
    elsif due_later? && due == "Due Later" || due == "toDisplay"
      puts "#{id}. #{display_status} #{todo_text} #{due_in_days}"
    end

  end

  def self.show_list

    puts "My Todo-list \n\n"
    dues = ['Overdue','Due Today','Due Later']
    dues.each do |due|
      puts "#{due}"
      all.map {|todo| todo.to_displayable_string(due)}
      puts "\n\n"
    end

  end

  def self.add_task(task)
    Todo.create!(todo_text: task[:todo_text], due_in_days: Date.today + task[:due_in_days]) do |u|
      u.completed = false
    end
  end

  def self.mark_as_complete!(todo_id)
    Todo.update(todo_id, completed: true)
  end



end
