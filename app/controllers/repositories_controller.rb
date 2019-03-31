class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    response = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = hidden
      req.params["client_secret"] = hidden
    end
    body_hash = JSON.parse(response.body)
    @items = body_hash["items"]
    render :search
  end
end
