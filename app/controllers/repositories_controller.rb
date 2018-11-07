class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   client_id = "Iv1.fece0933bfc9583a"
   secret = "41d449c64355b797e88f71945be8dcff75bba99b"

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
