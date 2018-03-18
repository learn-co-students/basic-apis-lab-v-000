class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3a72559801ba740dcd85'
      req.params['client_secret'] = '5c17f38edcac226ddc9435df696452fc5d82cb89'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
