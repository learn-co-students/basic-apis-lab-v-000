class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 326a57133cf4841d
    client_secret = 055608c913d5b62bbdd50d23985dc3610dcc8a34

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
  end

  body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
