class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?q=' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'dbbf28736f3057a4cb68'
      req.params['client_secret'] = '6ca5690e80a49b8a57aef64362427f77710851dd'
    end

    body_hash = JSON.parse(@resp.body)
      @repos = body_hash["items"]


  render 'search'
end
end
