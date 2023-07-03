Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
#   root to: 'lists#index'
#   resources :lists, except: %i[edit update] do
#     resources :bookmarks, only: %i[new create]
#   end
#   resources :bookmarks, only: :destroy
#   resources :reviews, only: :destroy
# end

get 'lists', to: 'lists#index'
post 'lists', to: 'lists#create'
get 'lists/new', to: 'lists#new', as: :new_list
get 'lists/:id', to: 'lists#show', as: :list
delete 'lists/:id', to: 'lists#destroy'

post 'lists/:id/bookmarks', to: 'bookmarks#create', as: :list_bookmarks
get 'lists/:id/bookmarks/new', to: 'bookmarks#new', as: :new_bookmark
delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
