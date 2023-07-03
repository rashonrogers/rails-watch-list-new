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
get 'lists/:id', to: 'lists#show', as: 'list'
# get 'lists/:id/edit', to: 'lists#edit', as: :edit_task
# patch 'lists/:id', to: 'lists#update'
delete 'lists/:id', to: 'lists#destroy'
end
