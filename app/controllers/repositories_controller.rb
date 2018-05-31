class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   client_id = 'd8961a3c07838d4b1772'
   client_secret = 'da7ad269bfed91b502b00bc156e7f86584976d56'
   
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