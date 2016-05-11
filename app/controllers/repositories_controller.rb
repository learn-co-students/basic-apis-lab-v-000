class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = '10cf1cca95e1134c5e4b'
     req.params['client_secret'] = '41e8823c48ae60a4d813983cb2bfe55ea3a26a68'
     req.params['q'] = params[:query]
   end
   body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
   render 'search'
  end




end
