class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "11d9261db4e8f2fdddf8"
    secret = "62e911ac18828dc3fec399143f1f1058796f8250"
    

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
