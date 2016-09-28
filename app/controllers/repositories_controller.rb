class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '2033c751639e7e6446d3'
      req.params['client_secret'] = 'f86dbd4491e586c3497eef13c2e32261b3ed26fe'
      req.params['q'] = params[:query]
      # req.params['sort'] = 'stars'
      req.params['order'] = 'desc'
    end

    body_hash = JSON.parse(@response.body)
    @repos = body_hash["items"]

    render 'search'
  end
end
