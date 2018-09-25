class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "285648a7978825ff4696"
      req.params['client_secret'] = "ff4f447417f2249da67b78c6b8b2b1a27fa5248f"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
