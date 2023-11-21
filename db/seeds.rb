puts 'Cleaning database...'

User.destroy_all
Quiz.destroy_all
Question.destroy_all
QuizQuestion.destroy_all

puts 'Creating users...'

User.create(user_name: 'Aisiri')
User.create(user_name: 'Bilal')
User.create(user_name: 'Elena')
User.create(user_name: 'Julia')

puts 'Creating questions...'

Question.create(content: 'What is the capital of France?', choice_one: 'Paris', choice_two: 'London')
Question.create(content: 'Which planet is known as the "Red Planet"?', choice_one: 'Mars', choice_two: 'Venus')
Question.create(content: 'What is the largest mammal in the world?', choice_one: 'Elephant', choice_two: 'Blue Whale')
Question.create(content: 'In which year did Christopher Columbus reach the Americas?', choice_one: '1492', choice_two: '1776')
Question.create(content: 'What is the main ingredient in guacamole?', choice_one: 'Avocado', choice_two: 'Tomato')
Question.create(content: 'Who wrote the play "Romeo and Juliet"?', choice_one: 'William Shakespeare', choice_two: 'Jane Austin')
Question.create(content: 'Which of the following is a primary color?', choice_one: 'Green', choice_two: 'Blue')
Question.create(content: 'What is the capital of Japan?', choice_one: 'Beijing', choice_two: 'Tokyo')
Question.create(content: 'What is the currency of the United Kingdom?', choice_one: 'Euro', choice_two: 'Pound Sterling')
Question.create(content: 'What is the largest ocean on Earth?', choice_one: 'Atlantic Ocean', choice_two: 'Pacific Ocean')

puts 'Creating quizzes...'

Quiz.create(user_id: 0, name: 'Easy Quiz')
Quiz.create(user_id: 1, name: 'Really Easy Quiz')
Quiz.create(user_id: 2, name: 'Rather Easy Quiz')
Quiz.create(user_id: 3, name: 'Easy Peasy Quiz')

puts 'Creating connections between questions and quizzes...'

for i in (0..3) do
  5.times do
    QuizQuestion.create(quiz_id: i, question_id: rand(0..9))
  end
end

puts 'Done!'
