class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    url = 'https://api.github.com/search/repositories'

    @resp = Faraday.get url do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params['query']
    end

    @repos = JSON.parse(@resp.body)['items']

    render :search
  end
end
