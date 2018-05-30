class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "be1bab4ebe8593415dd2"
    client_secret = "3aa7f1843d1c5a031d72669e0d5c0522e2103a72"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
     req.params["client_id"] = client_id
     req.params["client_secret"] = client_secret

    end


    body = JSON.parse(resp.body)
    @results = body["items"]

    render :search
  end




end
