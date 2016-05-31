class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'aeb3cfb5a5e74bd929ec'
      req.params['client_secret'] = '86e67c2271fdc1ab9640dc6e723c84cd4efb811b'
      req.params['q'] = params['query']
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash['items']
    render 'search'
  end
end
