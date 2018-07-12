class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "854c39df2f866cd3f15c"
    secret = "37b3f474525a6f0608ccba69d67a28c37872a495"
    
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
  end
  
  body = JSON.parse(resp.body)
  @results = body["items"]
  render :search
  end
end
