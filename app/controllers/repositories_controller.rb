class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '047df87b515e094d96ab'
      req.params['client_secret'] = 'c75cdae44d83073d6ebe0a7e0d5bbd1823930a4f'
      req.params['q'] = params[:query]
    end

    @repos = JSON.parse(@resp.body)['items']

    render 'search'
  end
end
