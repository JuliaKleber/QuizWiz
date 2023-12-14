# Quiz Application

This is a simple quiz application built with Ruby on Rails. The application allows users to take quizzes and view their results.

## Features

- User authentication
- Quiz creation
- Editing and deleting quizzes
- Playing quizzes
- Results calculation

## Built with

- Ruby on Rails
- SCSS
- Bootstrap
- Javascript / Stimulus
  
## Installation

Clone the repository:

  ```bash
  git clone https://github.com/GoldieCrystal/QuizWiz.git
  ```

Navigate into the directory:

  ```bash
  cd QuizWiz
  ```

Install dependencies:

  ```bash
  bundle install
  ```

Set up the database:
  ```bash
  rails db:migrate
  ```

Start the server:

  ```bash
  rails server
  ```

Open your browser and navigate to localhost:3000 to start using the application.

## Code Snippet

Here's a snippet from our `quizzes_controller.rb` file that calculates the results of a user's quiz:

```ruby
def results
  user_guesses = UserGuess.where(user_id: current_user)
  number_questions = user_guessses.length
  @count_correct = 0
  user_guesses.each { |guess| @count_correct += 1 if guess.is_correct }
  @count_wrong = number_questions - @count_correct
  user_guesses.each { |user_guess| user_guess.destroy }
end
```

This method retrieves all the guesses made by the current user, counts the number of correct guesses, calculates the number of wrong guesses, and then destroys all the user's guesses.

## Screenshot

![image](https://github.com/GoldieCrystal/QuizWiz/assets/142741980/ad0a408e-c171-4cf1-97ee-b0c88e257722)

## Authors

[Ehiaghe Aisiri](https://github.com/aghe-eng)

[Bilal Can Sinaci](https://github.com/canosin46)

[Elena Voda](https://github.com/ElenaVoda)

[Julia Kleber](https://github.com/GoldieCrystal)
