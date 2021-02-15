=begin

   Allan Alexander
   6:00 pm
   Friday, 12th February 2021

   Topic: Composition in Ruby
     Important:
        Class name starts with caps.
=end

class Movement
  def step
    puts 'Stepping'
  end

  def crawl
    puts 'crawling'
  end
end

class Human
  def initialize
    @movement = Movement.new
  end

  def move
    @movement.step
  end
end

class Raccoon
  def initialize
    @movement = Movement.new
  end

  def move
    @movement.crawl
  end
end

human = Human.new
human.move

raccoon = Raccoon.new
raccoon.move
