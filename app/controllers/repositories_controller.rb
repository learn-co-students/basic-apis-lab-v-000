class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = '8cdc1c94779010e0dd13'
      req.params["client_secret"] = '7aed47c1ad05b94e5a2479c614e480a6aa99956f'
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end

end
