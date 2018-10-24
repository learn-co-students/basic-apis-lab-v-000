class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body["items"]
    end
    render :search
  end
end
