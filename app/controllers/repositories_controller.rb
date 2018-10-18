
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "19363"
      req.params["client_secret"] = "aa:fe:5b:1b:47:44:27:ff:d8:8c:33:a1:82:d8:e2:eb:5c:d2:48:e8"
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
