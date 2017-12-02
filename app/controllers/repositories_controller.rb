class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "client_id"
      req.params['client_secret'] = 'client_secret'
      req.params['q'] = params[:query]
    end
      body_hash = JSON.parse(@resp.body)
      @results = body_hash["items"]
      render 'search'
    end


end
