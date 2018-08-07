class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = 'f0c57ed6e5bbc29a3ddb'
      req.params["client_secret"] = '85229db6b17b6de781b7e48300e26efcb1feb04c'
    end
    @repos = JSON.parse(@resp.body)
    render 'search'
  end
end
