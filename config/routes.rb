Rails.application.routes.draw do

  get '/search', to: 'repositories#search'
  post '/search', to: 'repositories#github_search'

  get '/callback', to: 'repositories#search'

  root 'repositories#search'
end
