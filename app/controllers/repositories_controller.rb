class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '035c64ba62f5a0e940f3'
      req.params['client_secret'] = 'f86f08818fd2f4db4426a5699464ac378555285f'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
