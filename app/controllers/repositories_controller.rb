class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # raise params.inspect
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'my actual client_id'
      req.params['client_secret'] = 'my_actual client_secret'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = "There was an error getting the repos"
    end
    render 'search'
  end
end
