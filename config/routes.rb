Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :quiz_questions, only: [:destroy]
  resources :quizzes do
    member do
      post :user_answers
      get :results
    end
    collection do
      get :my_own
    end
    resources :questions, only: %i[new create] do
      member do
        get :rewrite
      end
      collection do
        post :exchange
      end
    end
    # get 'questions/:id/rewrite', to: 'questions#rewrite_question', as: 'rewrite_quiz_question'
    # post 'questions', to: 'questions#exchange_question', as: 'exchange_quiz_question'
  end
  resources :questions, only: %i[show index]

  # Visit homepage as visitor & sign-up
  # // Alternate: if you are already a user the homepage will be
  # to either play a quiz or create a quiz
  # Log-in as user
#   get "login", to: "users#login"

#   # Play a quiz
#   # 1. Browse all quizzes
#   get "quizzes", to: "quizzes#index"
#   # 2. Choose a quiz to play, questions show up one at a time each
#   get "quizzes/:id", to: "quizzes#show"

#   # 3. Send off our answers as a user
#   get "quizzes/:quiz_id/user_answers/", to: "user_guesses#new"
#   # 4. Send off the filled out quiz
#   post "quizzes/:quiz_id/user_answers/", to: "user_guesses#create"
#   # 5. See results
#   get "quizzes/:id/results", to: "quizzes#results"

#   # Create a quiz
#   # 6. Craft a new quiz
#   get "quizzes/new", to: "quizzes#new"
#   post "quizzes", to: "quizzes#create"
#   # 7. See all quizzes i have created
#   get "my_quizzes", to: "quizzes#my_quizzes", as:
#   # 8. Choose to open and see one particular quiz
#   get "/quizzes/:id", to: "quizzes#show"
#   # 9. Update the quizzes i have created (change no.of questions, edit questions & answers)
#   get "/quizzes/:id/edit", to: "quizzes#edit"
#   patch "/quizzes/:id", to: "quizzes#update"
#   # 10. Delete a quiz i created
#   delete "/quizzes/:id", to: "quizzes#destroy"
end
