class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = 'Iv1.5000e69cfa29c150'
      req.params["client_secret"] = '0e0e142a1479316de62b26d7ed3c5b74fbc35235'
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body["items"]
    else
      @error = body["message"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
