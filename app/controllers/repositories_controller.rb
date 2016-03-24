class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories')do |req|
      req.params['client_id'] = 'id'
      req.params['client_secret'] = 'key'
      req.params['q'] = params[:query]
      #req.params['sort'] = params[:zipcode]
      #req.params['order'] = 'coffee shop'
      #req.options.timeout = 0
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search' 
  end

end
