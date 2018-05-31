class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   client_id = ''
   client_secret = ''
   
   @github = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['q'] = params[:query]
     req.params['client_id'] = client_id
     req.params['client_secret'] = client_secret
   end
   body = JSON.parse(@github.body)
   @repositories = body['items']
   render :search
  end
end