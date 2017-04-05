class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "34d52d29c28d9b804f09"
      req.params['client_secret'] = "5cbda98f86d5fac78cbcb88352790e5abcd96614"
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if@resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end

    render 'search'
  end
end
