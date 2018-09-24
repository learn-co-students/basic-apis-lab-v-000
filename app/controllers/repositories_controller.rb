class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    client_id = "b01cbaf88498ab14c859"
    secret = "56820122e0de9e4e256b09b8c670877581bcf00a"

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
