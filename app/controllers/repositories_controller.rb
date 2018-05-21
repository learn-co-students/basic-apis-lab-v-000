class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'my id'
      req.params['client_secret'] = 'my secret'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(resp.body)
    @repos = body_hash["items"]

    render 'search'
  end
end
