class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "be9ee16ec39bdfdbcd7f"
    secret = "a3b8aace511b332997dd9c31ae516cfffe2b83f7"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
