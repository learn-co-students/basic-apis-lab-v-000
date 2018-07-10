class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id # place id here
      req.params['client_secret'] = client_secret # place secret here
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end

end
