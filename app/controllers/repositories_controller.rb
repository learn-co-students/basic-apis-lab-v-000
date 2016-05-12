class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "bc38f720cc1d5ee6e597"
    secret = "5aa2e7bcc60249e5bb33372ac6f5047cdc3d1e83"

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
