class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params["query"]
    end
    @repos = JSON.parse(@resp.body)["items"]
    render 'search'
  end
end
