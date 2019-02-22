Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/search', to: 'repositories#search'
  post '/search', to: 'repositories#github_search'
  root 'repositories#search'
end
