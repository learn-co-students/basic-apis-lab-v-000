class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.6914fdac998a5191"
    client_secret= "62b88641756df7d01b061a34baca23eed3b9960f"
    @resp =  Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
