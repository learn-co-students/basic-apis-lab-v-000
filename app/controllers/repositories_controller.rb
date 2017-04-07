class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'f9c514f59d9d8c6b3f02'
    client_secret = '2fa7c5a3c419c694f6df4c644877a078555a3e2d'
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
