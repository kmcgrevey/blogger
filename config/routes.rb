Rails.application.routes.draw do
  # resources :articles
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
end
