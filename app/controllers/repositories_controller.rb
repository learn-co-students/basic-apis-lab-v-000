class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "fb55863b6906fc1832e7"
    secret = "4ed3e736bfd80d69b7e7228d12d5e795b7d74e00"

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
