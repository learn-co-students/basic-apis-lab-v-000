class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = '44f8dbb5936981965c31'
      req.params['client_secret'] = 'c88e9b025dc004bbdc5e549f8d18640c57a2b355'
      req.params['q'] = params[:query]

    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render 'search'
  end
end
