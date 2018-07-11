class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.f2001b78fc34e9ef"
    secret = "acb1b05b3a5cda2f0f1eb0cd03917466f13c7ca9"

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
