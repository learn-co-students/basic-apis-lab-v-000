class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = 'd4a5b4f4cbe9ec8a816d'
       req.params['client_secret'] = '46a9ff557ad3c35e5ea674d1c5fdcf06136c6305'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     @results = body["items"]
     render 'search'
   end
end
