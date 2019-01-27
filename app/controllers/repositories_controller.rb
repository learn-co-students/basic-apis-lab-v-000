class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     begin
      @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = "f9efad8bfffc755f5b4f"
        req.params["client_secret"] = "f5de995c149ff47c5be56cc295273f4b6170ba78"
      end

      body = JSON.parse(@resp.body)
      @results = body["items"]

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

      render :search
  end
end
