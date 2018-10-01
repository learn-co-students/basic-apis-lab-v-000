class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
      req.params['client_id'] = '25eaac6d3d7de8c3beb3'
      req.params['client_secret'] = 'dd93c858a1dd979466fb2b4e50425df27c27e99f'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]

    render 'search'
  end
end
