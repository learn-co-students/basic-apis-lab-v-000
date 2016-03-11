class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "e8e39e5e1f51a89e3c1d"
      req.params['client_secret'] = "36a605bf20f87bc24faa271bf64bb2b06d572ec7"
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash['items']
    render 'search'
  end
end
