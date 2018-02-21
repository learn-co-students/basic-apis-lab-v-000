class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params["q"] = params["query"]
      req.params["client_id"] = 'Iv1.fbd2f71fdd4b9219'
      req.params["client_secret"] = 'c6a550d08ad2f83b6d0a1e68f9c8bf45e510218c'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repo_url = body["items"][0]["html_url"]
      @desc = body["items"][0]["description"]
      @name = body["items"][0]["name"]
    else
      @error = body["meta"]["errorDetail"]
    end
    rescue Faraday::ConnectionFailed
      @error = "There was an issue sorry."
    end
      render "search"
  end
end
