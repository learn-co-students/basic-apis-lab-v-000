class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '096e35bb4015d21c579a'
      req.params['client_secret'] = '1576927496549a357e882cb6d96f12a95132775d'
    end

    parsed = JSON.parse(@resp.body)

    @repos = parsed['items']

    render 'search'

  end
end
