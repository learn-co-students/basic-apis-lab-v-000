class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = ''
    secret = ''

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
      @error = body["message"]
    end
    render 'search'
  end
end
