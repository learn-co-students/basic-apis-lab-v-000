class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['CLIENT_ID'] = ENV['GH_BASIC_CLIENT_ID']
      req.params['CLIENT_SECRET'] = ENV['GH_BASIC_SECRET_ID']
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
