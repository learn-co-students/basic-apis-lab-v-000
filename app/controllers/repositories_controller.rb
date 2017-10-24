class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params[:query]
    end
    #binding.pry
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body['meat']['errorDetail']
    end
    render :search
  end
end
