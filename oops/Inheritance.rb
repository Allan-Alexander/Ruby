class Animal
  def eat
    puts 'eating'
  end

  def sleep
    puts 'sleeping'
  end

  def move
    'move'
  end
end

class Human < Animal
  def yell
    puts 'yelling'
  end

  def move
    puts "#{super} like a jagger!"
  end
end

class Raccoon < Animal
  def move
    puts "#{super} like a roccoon!"
  end
end


human = Human.new

human.eat
human.move

raccoon = Raccoon.new

raccoon.eat
raccoon.move
