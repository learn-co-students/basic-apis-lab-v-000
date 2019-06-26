class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params["client_id"] = '0ba50f2420735d17a996'
      req.params["client_secret"] = 'e4ecb62acad776d523f01de1e811f10ec40119a4'
      req.params["q"] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end

end
