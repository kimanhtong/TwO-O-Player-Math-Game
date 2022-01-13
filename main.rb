require_relative 'game.rb'
require_relative 'player.rb'

# Init
game1 = Game.new
player1 = Player.new(game1.player1)
player2 = Player.new(game1.player2)
player1.set_questions
player2.set_questions

# Play
while game1.status != "completed"
  # Take turns to ask and answer questions
  game1.play(player1, player2)
  puts "---- NEW TURN ----"
  game1.play(player2, player1)
  puts "---- NEW TURN ----"

  # Check lives
  if player1.lives == 0 || player2.lives == 0
    game1.status = "completed"
    if player1.lives == player2.lives
      if player1.scores > player2.scores
        game1.winner = player1.name
        puts "Player #{player1.name} wins with a score of #{player1.scores}/#{player1.question_number - 1}"
      elsif player1.scores == player2.scores
        game1.winner = "Tie between #{player1.name} and #{player2.name}"
        puts "Players #{player1.name} and #{player2.name} tie with a score of #{player1.scores}/#{player2.question_number - 1}"
      else
        game1.winner = player2.name
        puts "Player #{player2.name} wins with a score of #{player2.scores}/#{player2.question_number - 1}"
      end
    end
    if player1.lives !=0
      game1.winner = player1.name
      puts "Player #{player1.name} wins with a score of #{player1.lives - player2.lives}/3"
    end
    if player2.lives != 0
      game1.winner = player2.name
      puts "Player #{player2.name} wins with a score of #{player2.lives - player1.lives}/3"
    end
  end

  # Add 3 more questions if no more left
  if player1.lives > 0 && player2.lives > 0
    if player1.question_number == player1.questions.length()
      player1.set_questions
    end
    if player2.question_number == player2.questions.length()
      player2.set_questions
    end
  end
end

# End game
game1.finalize