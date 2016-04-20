class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'b3b8239883d002c93ca9'
      req.params['client_secret'] = '94a79e4595a7b9cd3992cacf15963f5ca6108bbf'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
