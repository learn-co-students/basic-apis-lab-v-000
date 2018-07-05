Rails.application.routes.draw do
  get '/search', to: 'repositories#search'
  post '/search', to: 'repositories#github_search'
  root 'repositories#search'


# theoretical route for user strategy login
   # get '/auth/github/callback' => ''

end
