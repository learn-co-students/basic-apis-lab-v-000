class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = "d0324f981c3cc6686aa9"
    client_secret = "8a12880b0d0b214617c64a973c168571442470e5"

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    end

    render 'search'
  end
end
