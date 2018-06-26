class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.acc10009453c0a0c'
      req.params['client_secret'] = 'cc7a418716c9ab900196023d5d0dd5ce6a9aa5c5'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      @error = body["message"]
    end
    render :search
  end

end
