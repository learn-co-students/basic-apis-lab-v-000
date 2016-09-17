class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'e2ca89291b05c5d576da'
      req.params['client_secret'] = '4dfc6df9f38227841999696a80b1bfc6bfb7bb6d'
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render :search
  end
end
