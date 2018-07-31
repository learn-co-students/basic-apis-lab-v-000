class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "5e8749bb1ef294967a1b"
    secret = "130d8503fedc02a613f11cac6d8ebf95670829b2"

    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params["q"] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = secret
    end
    body_hash = JSON.parse(resp.body)
    @results = body_hash["items"]
    render :search
  end

end
