class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "c9158caf595a40b73307"
    secret = "329c50ed56552863d87b60851e6cc64fc4d5456a"

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
