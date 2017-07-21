class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "0212da7f8525799a516c"
    client_secret = "56f3a512998da526df6000d4f90ce88dd0af389c"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
