class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.4ef43884abcd35a9"
    client_secret = "34979db0810d3be33c9b4e1a03505d82540b9e71"

    result = Faraday.get("https://api.github.com/search/repositories") do |request|
      request.params["q"] = params[:query]
      request.params["client_id"] = client_id
      request.params["client_secret"] = client_secret
    end

    body = JSON.parse(result.body)
    @results = body["items"]
    render :search
  end
end
