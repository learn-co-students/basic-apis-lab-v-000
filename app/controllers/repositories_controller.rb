class RepositoriesController < ApplicationController

  def search
    
  end

  def github_search
    query = params[:query]
    @res = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q'] = query
    end
    @repos = JSON.parse(@res.body)["items"]
    render 'search'
  end
end
