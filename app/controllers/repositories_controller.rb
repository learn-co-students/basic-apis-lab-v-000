class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "7d4e6b17815514d3b552"
      req.params['client_secret'] = "f38744bd66165adfeb8993edce650ed4e95e88cb"
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)
    @repos = body["items"]
    render 'search'
  end
end
