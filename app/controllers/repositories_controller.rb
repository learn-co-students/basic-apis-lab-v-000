class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = "user:#{params[:query]}"
      req.params['client_id'] = 'abacd3c16e8f8d6f2952'
      req.params['client_secret'] = '607752453f36c7d56df2a09710e11bdc8d9b5ba9'
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
