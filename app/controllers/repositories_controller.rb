class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "4e626206500bc188bbb6"
    secret = "c67c2e9fe17193d0ae1037582d51d69d564cb544"

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
