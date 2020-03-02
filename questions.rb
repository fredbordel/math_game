
class Questions

  def initialize
    @x = rand(1..20)
    @y = rand(1..20)
  end

def display_questions
  puts "What does #{@x} plus #{@y} equal"
end

def total_sum
  return @x + @y
end

def validate(answer)
  if answer == @x + @y
    true
  else
    false 
  end
end

end
