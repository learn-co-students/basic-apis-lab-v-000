class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'client_id'
    client_secret = 'client_secret'

    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params['query']
    end

    @response_json = JSON.parse(@response.body)

    render 'search'
  end
end
