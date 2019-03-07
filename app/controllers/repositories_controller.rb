class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'e9fa4534bd657db64db5'
      req.params['client_secret'] = '62a4c4d5782d99f4003c614ff50a0e5ffd974857'
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end
end
