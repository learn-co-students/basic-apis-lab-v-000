class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '380613662b50444d0f19'
      req.params['client_secret'] = '19db3b9f05d4d6037169552f73aa8436a4305ee8'
      req.params['sort'] = 'updated'
      req.params['order'] = 'desc'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)

    @results = body['items']
    render 'search'
  end
end
