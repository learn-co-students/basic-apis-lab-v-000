class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '440455c1ca2e5c712ac1'
      req.params['client_secret'] = '442429ac032f30e60935b4914521738d06e2d0a7'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body_hash["items"]
    end
    render 'search'
  end
end
