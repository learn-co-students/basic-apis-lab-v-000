class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.c5ab1d547eedbee9"
    secret = "1b71088ff1b5eb7e6da6ab3ea32bb5a527ebf5d7"

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
