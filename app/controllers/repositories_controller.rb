class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'be874c003fcd259aa8bb'
      req.params['client_secret'] = '4cfb4b9ae2e52a4dfa6e8d248df8ce647fceda0f'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
