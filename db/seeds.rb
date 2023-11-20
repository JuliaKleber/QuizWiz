puts 'Cleaning database...'
User.destroy_all
Quiz.destroy_all
Question.destroy_all
QuizQuestion.destroy_all






# 5.times do
#   Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address,
#                     phone_number: Faker::PhoneNumber.phone_number,
#                     category: %w[chinese italian japanese french belgian].sample)
# end

User.create(username: 'Aisiri')
User.create(username: 'Bilal')
User.create(username: 'Elena')
User.create(username: 'Julia')

puts 'Creating users...'

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

puts 'Creating questions...'

puts 'Creating quizzes...'

puts 'Creating connections between questions and quizzes...'
