class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a3aa728ced987fcad8d3'
      req.params['client_secret'] = 'bfbc8ffda9c4eda3a2dc07c56fb60d2621c0c5f9'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
