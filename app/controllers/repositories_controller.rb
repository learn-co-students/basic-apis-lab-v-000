class RepositoriesController < ApplicationController
  require 'pry'
  def search

  end

  def github_search
    client_id = "removed"
    secret = "removed"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search

  end 
end
