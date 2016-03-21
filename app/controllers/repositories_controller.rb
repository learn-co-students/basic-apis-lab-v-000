class RepositoriesController < ApplicationController

  def search

  end

  def github_search 
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end
    new_hash = JSON.parse(@resp.body)
    @repos = new_hash["items"]
    render 'search'  
  end
end
