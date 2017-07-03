class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["client_id"] = "af357c9ef1c1d572572a"
      req.params["client_secret"] = "b75295fb1b89f527fefec69c15955794a40451ca"
      req.params["q"] = params[:query]
    end

    body = JSON.parse(@resp.body)
    
    @results = body["items"]
    
    render :search
  end
end