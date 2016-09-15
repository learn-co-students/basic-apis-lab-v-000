class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['access_token'] = 'b0d5052e246632f571a5474dad4d06ddeed3ddbe'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @items = body['items']
    
    render 'search'
  end
end
