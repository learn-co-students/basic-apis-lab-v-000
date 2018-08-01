class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "078650f1bff6e53dc843"
      req.params["client_secret"] = "722011c4411c4c4e77cfc0743dc2a1e4cfe474c3"
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
