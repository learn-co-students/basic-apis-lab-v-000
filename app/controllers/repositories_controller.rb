class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = "Iv1.835814dca52676a7"
      req.params['client_secret'] = "3c77a97eeb69a5ad82d3ea12a60cd4c750897053"
      req.params['query'] = "tetris"
    end

    # 
    # binding.pry

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

    render 'search'
  end
end
