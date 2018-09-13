class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # req.params['client_id'] = '25afcb7d0737e8778f47'
      # req.params['client_secret'] = '85d9abf734d631c9f41395ca5a8579c8c29b8161'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)
    if resp.success?
      @repos = body["items"]
    else
      @error = body["errors"]
    end
    render 'search'
  end
end
