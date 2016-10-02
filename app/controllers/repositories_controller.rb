class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '957f58322d400d09137f'
      req.params['client_secret'] = '7b93c522580460a618f07da166e6217f5e07b778'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]


    render 'search'

#name, link to repository, description
  end
end

#["items"][2]["owner"]["login"]
#@items.each do |item| 
#item["owner"]["login"]