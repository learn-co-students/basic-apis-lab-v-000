class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'c79cf9b633f284a82876'
      req.params['client_secret'] = '4334168c1f32fa335b7930f76d7b5e4679066c6e'
      req.params['q'] = params[:query]


    end
    body = JSON.parse(@resp.body)
    @query = body["items"]
    render 'search'
  end
end
