class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.86ca8988611de93b'
      req.params['client_secret'] = 'Iv1.86ca8988611de93b'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash['items']
    render 'search'
  end
end
