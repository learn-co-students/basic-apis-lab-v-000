class RepositoriesController < ApplicationController
  def github_search
    response = Faraday.get("https://api.github.com/search/repositories") do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = "Iv1.49b9d27bc7563c7b"
    req.params["client_secret"] = "cf774b1539e3eaa12d9a89466acd7e179491293f"
    end
   body = JSON.parse(response.body)
   @results = body["items"]
   render :search
  end
end
