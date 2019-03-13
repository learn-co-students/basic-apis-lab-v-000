class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "PLACEHOLDER"
    client_secret = "PLACEHOLDER"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end

    body = JSON.parse(@resp.body)
    @res = body["items"]
    render "search"
  end
end
