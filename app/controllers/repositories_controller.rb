class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = ENV['CLIENT_ID']
      req.params["client_secret"] = ENV['CLIENT_SECRET']
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end

end
