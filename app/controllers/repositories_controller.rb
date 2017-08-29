class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "cb0607e9fc656cf321f5E"
    secret = "00878df42c823e5a1590df0eabd871b19c3e5874"

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
