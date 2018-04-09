class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_secretid'] = ""
      req.params['client_secret'] = ""
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repositories = body['items']
    render 'search'
  end
end
