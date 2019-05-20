class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.7bda20aa0b8e7289"
    secret = "8a0fecf8b23f1f7b09df540d1025950435dd9d8b"

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
