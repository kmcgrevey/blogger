Rails.application.routes.draw do
  resources :articles
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  post '/articles', to: 'articles#create'
  get '/articles/:id', to: 'articles#show'
  delete '/articles/:id', to: 'articles#destroy'
end
