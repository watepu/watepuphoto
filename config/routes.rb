Rails.application.routes.draw do

  get '/' => "home#top"

  resources :users
  resources :sessions
  resources :pictures do
    collection do
      post :confirm
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
