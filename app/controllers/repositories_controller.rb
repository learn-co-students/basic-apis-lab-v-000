class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '9dc0b36308dee688194e'
    client_secret = 'a805b2c8c164761517b682f7874b36727ff8bea9'

    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params['query']
    end

    @response_json = JSON.parse(@response.body)

    render 'search'
  end
end
