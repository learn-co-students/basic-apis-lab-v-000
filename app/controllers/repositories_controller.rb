class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      client_id = "3bd3d9b0a2510cbdfbab"
      secret = "2d7ee3a80b282132e5ef6f949b43d7e1baa763b4"

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
