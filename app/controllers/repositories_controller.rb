class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "fdd768539a039f785f1d"
    client_secret = "58508856083ed7575671b74f31d27fef9e8a2429"

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
