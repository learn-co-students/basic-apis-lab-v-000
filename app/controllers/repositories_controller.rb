class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '1fa77ea7447636297600'
      req.params['client_secret'] = '32b8031d77de770590e841f0ce4562572ef0d4c2'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render 'search'
  end

end
