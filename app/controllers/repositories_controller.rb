class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd5771a0df9bff996dc43'
      req.params['client_secret'] = '1c6219219e5b3a30f2b271469d684f4b3ab66196'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash['items']
    render 'search'
  end
end
