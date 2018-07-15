class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['clientID'] = "Iv1.60ac623a24fd826a"
      req.params['secret'] = "48ee3507a7ddbd2b12fee6d5cc6b03bb2eb3d1c8"
      req.params['q'] = params[:query]
    end

    if @resp.success?
      @repos = JSON.parse(@resp.body)["items"]
    else
      @error = "Uh oh. Something went wrong."
    end
    render 'search'
  end
end
