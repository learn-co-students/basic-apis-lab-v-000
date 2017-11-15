class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?q=tetris' do |req|
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render 'search'
  end
  
end