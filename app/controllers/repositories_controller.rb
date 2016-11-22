class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params['q'] = params[:query]
        req.params["client_id"] = '5ab5eb4b487223de110d'
        req.params["client_secret"] = 'd6c0753a25595069c685887e898fbfde2e20392f'
      end
      body = JSON.parse(@resp.body)
      @repos = body['items']
    render 'search'
  end
end
