class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "47dee076e261604445e2"
      req.params["client_secret"] = "c40abe47f73c8be06b016a918881fc7e209f85ba"
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search 
  end
end
