class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    
    client_id = 'af357c9ef1c1d572572a'
    secret = 'b75295fb1b89f527fefec69c15955794a40451ca'
    
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = secret
    end
    
    @results = JSON.parse(resp.body)["items"]
    
    render 'search'
  end
end
