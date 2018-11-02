class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'b12a9ff3f5eae0e84197'
      req.params['client_secret'] = 'c261a6766537ae2ad1df1fd39089743991b47fdb'
      req.params['q'] = 'tetris'
    end

    body = JSON.parse(@resp.body)
    @repo = body["items"]
    render 'search'
  end
end
