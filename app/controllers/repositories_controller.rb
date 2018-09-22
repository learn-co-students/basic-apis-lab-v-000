class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '173639b581371779121d'
      req.params['client_secret'] = '6b96ecfcb8c09064c4c52fb90e7bf5e3a9ae2ae2'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end
end
