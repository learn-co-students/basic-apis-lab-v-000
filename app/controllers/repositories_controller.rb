class RepositoriesController < ApplicationController

  def search


  end

  def github_search
    client_id = "e87c44b12148de07ac10"
    secret = 'b09fbaf11745c64d9568fc3cd67af550310f66fa'

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
