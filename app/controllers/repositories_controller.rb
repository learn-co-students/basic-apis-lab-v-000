class RepositoriesController < ApplicationController

  def search
   
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '37f0a2a1cb7de4eb4019'
      req.params['client_secret'] = '8abc56a7db57e808140dbe9b4eb0f3eb63b89081'
      req.params['q'] = params[:query] 
     end

     body_hash = JSON.parse(@resp.body)
     @items = body_hash["items"] 
     render 'search'
  end
end
