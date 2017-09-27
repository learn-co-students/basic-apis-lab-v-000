class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '7447cac0a195762bc696'
      req.params['client_secret'] = '7c5b23fe16d07522890bb05088e4a7253faeaee6'
    end
    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash['items']
    render 'search'
  end

end
