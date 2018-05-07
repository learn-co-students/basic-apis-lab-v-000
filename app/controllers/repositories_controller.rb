class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "45a713864eae70a22271"
    secret = "4af5f2621d35b6429acbf24b0e50e0815bcf6790"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(@resp.body)

    @results = body["items"]

    render 'search'
  end

end
