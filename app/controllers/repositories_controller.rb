class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    response = Faraday.get 'https://api.github.com/search/repositories?' do |req|
      req.params['q'] = params[:query]
      req.params['client_id']= 'ef5bc224a2a2c8d467d3'
      req.params['client_secret']=  '98d75c890592d7bb974f1d1bdb7d1f9e25e225e1'
    end

    body = JSON.parse(response.body)
    if response.success?
      @repos = body["items"]
    else
      @error = "error"
    end
    render 'search'
  end
end
