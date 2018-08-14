class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '1d5b7ae1cbeef2d7a7c9'
    client_secret = 'cfda84d141d1d3f8de82bbbcd43a35fdb11361c7'

    @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end


end
