class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.baa714931997cdcc"
    secret = "651366c19640a687d2825c9ff27657a22f552207"

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
