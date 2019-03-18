class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params["client_id"] = "Iv1.02d48367490a461e"
      req.params["client_secret"] = "1b9e37eb1dd16cb2993948e8154f278424170f91"
      req.params["q"] = params[:query]
    end
    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    else
      @error = "Incomplete Results"
    end
    render 'search'
  end

end
