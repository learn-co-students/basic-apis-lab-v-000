class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '7c56acd0cd3d67c7158d'
      req.params['client_secret'] = 'cb6fd7ac942d9f767b9c13e32ae6f5eab6fe645e'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body['items']
    render 'search'
  end
end
