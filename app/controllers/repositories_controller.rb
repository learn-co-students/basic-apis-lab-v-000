class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'Iv1.e03b22688435fbb6'
        req.params['client_secret'] = 'abef95a45c80150f8884e15b27ccf8719e41595a'
    end
      body = JSON.parse(@resp.body)
      @items = body["items"]
      render 'search'
  end
end
