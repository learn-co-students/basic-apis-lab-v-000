class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '27b1c1da5283f059b561'
      req.params['client_secret'] = 'e1e131ce9df0d13814cd31fb76d0647dcf67022e'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @query = body["items"]
    render 'search'
  end

end
