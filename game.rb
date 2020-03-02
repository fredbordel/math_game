require_relative './player'
require_relative './questions'

class Game

  def initialize
  @player1 = Player.new("Gollum")
  @player2 = Player.new("Fresh fish")
  @players = [@player1, @player2].shuffle
  @turn = 1
end

def display_turn
  puts "------- NEW TURN -------"
end

def one_turn(players)
player_turn = @players[0]
question = Questions.new
puts "#{player_turn.name}:"
puts "#{question.display_questions}"
answer = gets.chomp.to_i

if !question.validate(answer)
  player_turn.life -= 1
  puts "#{player_turn.name}: Bad answer, sorry. You lose a life!"
else 
  puts "#{player_turn.name}: Good job!"
end
end

def turn_summary 
  puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
end

def next_turn
  @players.rotate!
  @turn += 1
end

def alive_player
  @players.select {|player| player.life > 0}
end

def winner
  alive_player.first
end

def game_over?
  alive_player.count <= 1
end

def gameplay
  until(game_over?) do
    display_turn
    one_turn(@players)
    turn_summary
    next_turn
  end
  puts "--------------------------------"
  puts "#{winner.name} won, brrrrrrravo!"
  puts "--------------------------------"
end

end

