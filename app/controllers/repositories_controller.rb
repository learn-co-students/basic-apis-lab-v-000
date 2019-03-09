class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "54f71d591a12856e250b"
      req.params['secret'] = "ae4d51b5627d03b19023d4fb21c8a92d1b3e17a2"
      req.params['q'] = params['query']
    end
    resp_hash = JSON.parse(resp.body)
    @results = resp_hash['items']
    render 'search'
  end
end
