class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '43f94f8160d33eb99dd7'
      req.params['client_secret'] = '7b7c7879fadc5da4a46862bbd82071de67d83b41'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body['items']

    render 'search'
  end
end
