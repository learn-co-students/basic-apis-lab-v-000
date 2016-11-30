class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = # your client_id here (string)
      req.params['client_secret'] = # your client_secret here (string)
      req.params['q'] = params[:query]
    end
    
    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    else
      @error = "There was an error. Please try again."
    end

    render 'search'
  end
end