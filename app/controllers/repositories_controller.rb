
class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = "id"
    secret = "secret"

    resp = Faraday.get("https://api.github.com/search/repositories") do |r|
      r.params["q"] = params[:query]
      r.params["client_id"] = client_id
      r.params["client_secret"] = secret
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
