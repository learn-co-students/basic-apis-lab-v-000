class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'f75d9c1cc6dc2fc21101'
    req.params['client_secret'] = '8727bb1fd4538662da5abc36dac221a1a24e8d50'
    req.params['q'] = params[:query]
  end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end

end
