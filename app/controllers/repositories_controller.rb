class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    @res = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      # req.params["client_id"] = client_id
      # req.params["client_secret"] = secret
    end

    body = JSON.parse(@res.body)
    @results = body["items"]
    render :search
  end
end
