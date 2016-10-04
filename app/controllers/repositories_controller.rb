class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["token"] = "token"
        req.params["q"] = params["query"]
      end

      body = JSON.parse(@resp.body)
      @repos = body["items"]
    rescue
      @error = "There was a timeout. Please try again."
    end
    render "search"
  end
end