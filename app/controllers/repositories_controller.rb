require 'pry'

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "5ef575146a8e5759d31a"
    client_secret = "dbc175466f4748573128c1570708b492e982f736"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
