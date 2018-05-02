class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.8cd25ae1ee926f75'
      req.params['client_secret'] = 'ec8ea2152884a4c988627ba84040bbb429a8cad9'
    end
    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash['items']
    render 'search'
  end
end
