class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] =  'Iv1.1af8bf2375f05b79'
      req.params['client_secret'] = '21a4c1b21141bb63229eb8a8afa0977771d3a7ea'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
