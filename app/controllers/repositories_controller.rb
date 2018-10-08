class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "5565ad47801c382fad5e"
    secret = "3e4adc20eda8d41c963e63eb5a1159792f20223c"

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
