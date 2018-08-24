class RepositoriesController < ApplicationController
  def github_search
    response = Faraday.get("https://api.github.com/search/repositories") do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = "cad3ff4f1db39520c385"
    req.params["client_secret"] = "d545bc3b0712d21563cf02f67a9858f97cf1f0ea"
    end
   body = JSON.parse(response.body)
   @results = body["items"]
   render :search
  end
end
