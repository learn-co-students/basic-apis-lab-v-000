class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "c4e4188829555f94bd10"
      req.params['client_secret'] = "cc9c37214c6a075865c486236e2b2bb7cb64f14d"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
