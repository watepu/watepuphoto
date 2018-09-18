Rails.application.routes.draw do

  get '/' => "home#top"
  get 'about' => "users#about"

  resources :users
  resources :sessions
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
