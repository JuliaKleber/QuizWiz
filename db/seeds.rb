require "open-uri"


puts 'Cleaning database...'

UserGuess.destroy_all
QuizQuestion.destroy_all
Quiz.destroy_all
Question.destroy_all
User.destroy_all

puts 'Creating users...'


users = []


user = User.new(user_name: 'Aisiri', email: "Aisiri@quiz-wiz.com", password: "123456", password_confirmation: "123456")
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save
users << user
user = User.new(user_name: 'Bilal', email: "Bilal@quiz-wiz.com", password: "123456", password_confirmation: "123456")
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save
users << user
user = User.new(user_name: 'Elena', email: "Elena@quiz-wiz.com", password: "123456", password_confirmation: "123456")
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save
users << user
user = User.new(user_name: 'Julia', email: "Julia@quiz-wiz.com", password: "123456", password_confirmation: "123456")
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save
users << user

puts 'Creating questions...'

questions = []

question = Question.new(content: 'What is the capital of France?', choice_one: 'Paris', choice_two: 'London', correct_choice: 'choice_one')
questions << question
question = Question.new(content: 'Which planet is known as the "Red Planet"?', choice_one: 'Mars', choice_two: 'Venus', correct_choice: 'choice_one')
questions << question
question = Question.new(content: 'What is the largest mammal in the world?', choice_one: 'Elephant', choice_two: 'Blue Whale', correct_choice: 'choice_two')
questions << question
question = Question.new(content: 'In which year did Christopher Columbus reach the Americas?', choice_one: '1492', choice_two: '1776', correct_choice: 'choice_one')
questions << question
question = Question.new(content: 'What is the main ingredient in guacamole?', choice_one: 'Avocado', choice_two: 'Tomato', correct_choice: 'choice_one')
questions << question
question = Question.new(content: 'Who wrote the play "Romeo and Juliet"?', choice_one: 'William Shakespeare', choice_two: 'Jane Austin', correct_choice: 'choice_one')
questions << question
question = Question.new(content: 'Which of the following is a primary color?', choice_one: 'Green', choice_two: 'Blue', correct_choice: 'choice_two')
questions << question
question = Question.new(content: 'What is the capital of Japan?', choice_one: 'Beijing', choice_two: 'Tokyo', correct_choice: 'choice_two')
questions << question
question = Question.new(content: 'What is the currency of the United Kingdom?', choice_one: 'Euro', choice_two: 'Pound Sterling', correct_choice: 'choice_two')
questions << question
question = Question.new(content: 'What is the largest ocean on Earth?', choice_one: 'Atlantic Ocean', choice_two: 'Pacific
  Ocean', correct_choice: 'choice_two')
questions << question

questions.each_with_index do |quest, i|
  quest.user = users.sample
  quest.save
end

puts 'Creating quizzes...'

quizzes = []

quiz = Quiz.new(name: 'Easy Quiz')
quizzes << quiz
quiz = Quiz.new(name: 'Really Easy Quiz')
quizzes << quiz
quiz = Quiz.new(name: 'Rather Easy Quiz')
quizzes << quiz
quiz = Quiz.new(name: 'Easy Peasy Quiz')
quizzes << quiz

quizzes.each_with_index do |q, i|
  q.user = users[i % users.size]
  q.save
end

puts 'Creating connections between questions and quizzes...'

quizzes.each do |q|
  5.times do
    qq = QuizQuestion.new(quiz_id: q.id, question_id: questions.sample.id)
    qq.save

  end
end

puts 'Done!'
