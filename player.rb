class Player
  attr_accessor :name, :lives, :questions, :answers, :question_number, :scores
  def initialize name
    @name = name
    @lives = 3
    @scores = 0
    @questions = []
    @answers = []
    @question_number = 0
  end

  # Create 3 pairs of questions and answers
  def set_questions
    puts "Player #{@name}, pls create 3 (more) math questions"
    i = 1
    while i <= 3
      print "Pls type in question #{i}: "
      question = gets.chomp()
      @questions.push(question)
      print "Pls type in the answer: "
      answer = gets.chomp()
      @answers.push(answer)
      i += 1
    end
  end

  # Ask questions and score
  def ask_question (other_player)
    puts "Player #{self.name}: #{self.questions[self.question_number]}"
    answer = gets.chomp()
    if answer == self.answers[self.question_number]
      puts "YES! You are correct."
      other_player.scores += 1
    else
      puts "Seriously? No!"
      other_player.lives -= 1
    end
    self.question_number += 1
  end
end