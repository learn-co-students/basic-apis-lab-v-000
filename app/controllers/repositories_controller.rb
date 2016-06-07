class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = "d93cd9fadfe4c8c324f2"
      req.params['client_secret'] = "ad45dab747c0fe8c7acf43a223fc8e20e3191d01"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end

end