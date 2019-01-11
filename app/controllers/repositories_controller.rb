class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  req.params['q'] = params[:query]
  req.params['client_id'] = '13d7ff567df182db9b8d'
  req.params['client_secret'] = '472a8cdc8986dba5393ebeb5cde3354a0954c79b'
end

body = JSON.parse(@resp.body)
@results = body["items"]
render 'search'

  end
end
