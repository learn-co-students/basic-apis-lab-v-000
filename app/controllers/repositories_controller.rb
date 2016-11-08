class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'removed before pushing to gh'
      req.params['client_secret'] = 'removed before pushing to gh'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
