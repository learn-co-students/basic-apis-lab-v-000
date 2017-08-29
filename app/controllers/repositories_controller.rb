class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '130acfaee9f9f461bd12'
      req.params['client_secret'] = '0fc9931d05a3f1affad004be3fc7caecaec064f3'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render "search"
  end
end
