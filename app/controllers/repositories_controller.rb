class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.8090d13e1589f96d'
    client_secret = 'd852b6b710f4d66bbde2070c076309e4332843c1'

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash['items']
    render 'search'
  end
end
