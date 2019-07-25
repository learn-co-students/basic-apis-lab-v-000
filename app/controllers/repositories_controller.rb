class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    response = Faraday.get("https://api.github.com/search/repositories") do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = ''
    req.params["client_secret"] = ''
  end
    body_hash = JSON.parse(response.body)
    @items = body_hash["items"]
    render :search
  end
  
end
