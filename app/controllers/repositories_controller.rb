class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "dfb223ddbf4c0a4b70d9"
      req.params["client_secret"] = "2cd5da6a595c27ef226c3e66194d8fed136658b4"
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
