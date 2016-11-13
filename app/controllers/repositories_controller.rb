class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'ab948a1dfd64b75e5a6b'
      req.params['client_secret'] = '4979890ba100771fd422591e8a3185616cb78fd7'
      req.params['q'] = params['query']
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
