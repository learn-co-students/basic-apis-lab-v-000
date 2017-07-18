class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'f7c314f59d9d8c6b3f01'
    client_secret = '5fa7c9a3c419c694f6df4c644877a078555a3e2d'
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body['items']

    render 'search'
  end
end
