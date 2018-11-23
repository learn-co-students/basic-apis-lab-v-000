class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '3e14f8d2b5262ca7330c'
      req.params['client_secret'] = '17715c8aed58d858329200a515b9518a7096dd96'
      req.params['query'] = 'tetris'
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

    render 'search'
  end
end
