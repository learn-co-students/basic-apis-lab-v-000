class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
    end
    if resp.success?
      @repos = JSON.parse(resp.body)["items"]
    else
      @error = JSON.parse(resp.body)["errors"]
    end
    render 'search'
  end
end
