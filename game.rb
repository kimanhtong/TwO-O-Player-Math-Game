

# Nouns for classes
# Questions (questions, aswers, scores) - display questions, record answers, score, compare scores
# Players (life, score) - record score, track life


# Game
# Players

class Game
  attr_accessor :player1, :player2, :status, :winner, :current_player
  def initialize
    @status = "initializing..."
    @winner = "unknown"
    print "Please type in name of Player 1: "
    @player1 = gets.chomp()
    print "Please type in name of Player 2: "
    @player2 = gets.chomp()
    while player1 == player2
      print "Names are duplicated. Please use a different name of Player 2: "
      @player2 = gets.chomp()
    end
  end

  def play (playerA, playerB)
    @status = "playing..."
    @current_player = playerA.name
    playerB.ask_question(playerA)
    puts "Life/ Lives left - #{playerA.name}: #{playerA.lives}/3, #{playerB.name}: #{playerB.lives}/3"
    puts "Scores - #{playerA.name}: #{playerA.scores}/#{playerB.question_number}, #{playerB.name}: #{playerB.scores}/#{playerA.question_number}"
  end

  def finalize
    @current_player = ""
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end

end

