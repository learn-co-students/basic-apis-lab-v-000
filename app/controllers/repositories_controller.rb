class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    searchTerm = params[:query]
    site = 'https://api.github.com/search/repositories'
    client_id = '36f66e93f31cde436cb5'
    client_secret = '34ebef41742bc6b45dda7b8932ee4f146f05e76e'

    @resp = Faraday.get(site) do |req|
      req.params['q'] = searchTerm
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end
    
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body_hash["items"]
    end

    render 'search'
  end
end
