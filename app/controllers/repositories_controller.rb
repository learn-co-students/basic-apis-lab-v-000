class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6e56140512a4d43b663e'
      req.params['client_secret'] = '82c0e73f41e68aa1f5c101a81a417674957315b7'
      req.params['q'] = params['query']
    end

    resp_hash = JSON.parse(@resp.body)
    @repos = resp_hash['items']
    render 'search'
  end
end
