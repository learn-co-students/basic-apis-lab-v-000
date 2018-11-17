class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'c02f8e87c69938782f45'
      req.params['client_secret'] = '5539dd9760097a4f1ecf8d8ed8d07c58f639b558'
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

    render 'search'
  end
end
