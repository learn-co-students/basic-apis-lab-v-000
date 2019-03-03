class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = "Iv1.7d3ec104ca1b1d78"
      req.params['client_secret'] = "b312059fc109dbfb2487d57e47c07a5ac2f81809"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body['items']
    render 'search'
  end
end
