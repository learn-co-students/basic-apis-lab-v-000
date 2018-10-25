class RepositoriesController < ApplicationController
  
  def search
  end

  def github_search
    client_id = '5508304abdd435fa4549'
    client_secret = 'dc6ebbd1b3b9896a56937ea2f7fa4326b7d87423'

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
      req.params["q"] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render :search
  end
end
