class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = "0132c25a6668e6a15380"
      req.params['client_secret'] = "753759e72a87f3b52c13bb24045799378f0715ad"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    @repositories = body["items"]

    render 'search'
  end
end
