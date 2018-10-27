class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "78034be3086eb8e31b46"
    secret = "28a7fa96db276837ad2110b025327aacbb8122f3"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render 'search'
  end
end
