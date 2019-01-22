class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    query = params['query']
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "717f3cc427074e0b75c1"
      req.params['client_secret'] = "a8d5f643cb03b3f869c0995762108d8dc0ea9e71"
      req.params['q'] = query
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end


end
