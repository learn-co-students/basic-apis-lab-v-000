class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @items = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '7f6a91acd1e189554478'
      req.params['client_secret'] = 'd3f28ac0313b484958246b2b19bbf561c30d63d3'
    end

    body = JSON.parse(@items.body)

    if @items.success?
      @repos = body['items']
    else
      @error = 'there was an error!'
    end

    render 'search'
  end
end
