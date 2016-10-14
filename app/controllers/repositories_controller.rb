class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "400b8a4cb48381aacc76"
    secret = "401293fb16ea6c7707f69949e297171f98fa4cea"

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
