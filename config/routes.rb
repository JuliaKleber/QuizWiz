Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :quiz_questions, only: [:destroy]
  resources :user_guesses, only: [:create]
  get 'user_guesses/results', to: 'user_guesses#results'

  resources :quizzes do
    member do
      # get :results
      get :play
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
  end
end
