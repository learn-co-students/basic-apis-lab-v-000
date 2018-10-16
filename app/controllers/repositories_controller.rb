class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '37d050322b48096f92f0'
      req.params['client_secret'] = '874e8c93a26c0e2e048ce9a7d2e007f25a49c694'
    end
    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash["items"]
    render 'search'
  end
end
