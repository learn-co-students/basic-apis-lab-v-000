class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = 'd0c0327d107d671d59f5'
      req.params["client_secret"] = 'e8ca50d385e8c03f74c8deb75de3667909b058fa'
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
