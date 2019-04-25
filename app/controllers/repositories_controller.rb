class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.a4e39d04e53a4dc7'
        req.params['client_secret'] = '39ce8abcd36a54c78f13e4f76cae5fb5a87d0eef'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
        @repositories = body["items"]
      render 'search'
    end
end
