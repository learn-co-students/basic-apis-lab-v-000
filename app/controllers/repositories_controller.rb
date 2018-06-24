class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params['client_id'] = 'f1a6907500f611b0f466'
      req.params['client_secret'] = '543bfac37a0c69a9bedd740d494371ee56e82205'
      #req.params['v'] = '20160201'
      #req.params['near'] = params[:zipcode]
      #req.params['query'] = 'coffee shop'
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
