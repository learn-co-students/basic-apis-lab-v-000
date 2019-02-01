class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = '874068f83cfe0669ccbd'
    req.params['client_secret'] = 'de897fdb0e2e4c5c41ea28396342fecea9859833'
    req.params['q'] = params[:query]
  end
  body = JSON.parse(@resp.body)
  @response = body['items']
  render 'search'
  end
end
