class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # set variable for id and secret
    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    # reached out to git hub to get JSON response
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = secret
      req.params['q'] = params[:query]
  end

  # parses JSON Response
  body_hash = JSON.parse(@resp.body)
  @repos = body_hash['items']
  render 'search'
  end

end
