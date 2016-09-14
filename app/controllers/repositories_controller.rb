class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = '9c62f17a50f306b65bfe'
      req.params['client_secret'] = 'fb21754c545b31f47bd3941a6eeee57517899316'
      req.params['q'] = params[:query]
    end
      body = JSON.parse(@resp.body)
      @repos = body["items"]
      render "search"

    end
  end


# Client ID
# 9c62f17a50f306b65bfe
# Client Secret
# fb21754c545b31f47bd3941a6eeee57517899316