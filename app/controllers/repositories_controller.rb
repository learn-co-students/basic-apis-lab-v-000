class RepositoriesController < ApplicationController

  def search

  end


  def github_search
    client_id = "8706b1b7ddd9a1e7b765"
    secret = "f2a284da7947531685982c45d1bf306c1db5d2e8"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end


end
