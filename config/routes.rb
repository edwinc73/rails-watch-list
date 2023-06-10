Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: %i[show] do
    resources :lists, only: %i[new create] do
      resources :bookmarks, only: %i[new create]
    end
  end
  resources :lists, only: %i[index show destroy]
  resources :bookmarks, only: %i[destroy]
  # root "articles#index"
end

# lists/user_id/new/
# lists/user_id/list_id/new
