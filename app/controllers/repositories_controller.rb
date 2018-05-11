class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'b9dd205e5f9a10a226ad'
        req.params['client_secret'] = '4230a55ffc4715937224a6754dd9f713ad6855b0'
        req.params['q'] = params[:query]
      end
      @body = JSON.parse(@resp.body)
      @repos = @body['items']
      render 'search'
  end
end
