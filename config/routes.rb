Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :quiz_questions, only: [:destroy]
<<<<<<< HEAD
  resources :user_guesses, only: [:create]
=======
  resources :user_guesses, only: [:destroy]

>>>>>>> master
  resources :quizzes do
    member do
      get :results
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
