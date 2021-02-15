require'./connect_db.rb'
require'./Todo.rb'
connect_db!

# puts Todo.to_displayable_list
puts Todo.where(completed:true).to_displayable_list
