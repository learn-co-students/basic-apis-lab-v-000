class RepositoriesController < ApplicationController

  def search

  end

  def github_search
@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = '56edd8ab1d5cee53d163'
    req.params['client_secret'] = '5967e03c47e15f40e2c81aa520e97b84955a1b35'
    req.params['q'] = params[:query]
  end
  body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
