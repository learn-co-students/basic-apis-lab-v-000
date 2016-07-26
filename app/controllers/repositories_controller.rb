class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "42d6f3f548295015812d"
    secret = "ef21a65a3ae6b5e2222f9ce023dc757c0e778d27"

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
