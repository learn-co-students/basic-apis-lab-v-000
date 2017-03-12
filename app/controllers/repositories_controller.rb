class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "d0d5b143f3052a7b0565"
      req.params["client_secret"] = "5cf9e73dd39c1693a253c9731ce15dfb6ab7b647"
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
