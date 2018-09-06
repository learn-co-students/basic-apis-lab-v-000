class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      # put in real client id and client secret to get program to work
      req.params["client_id"] = CLIENT_ID
      req.params["client_secret"] = CLIENT_SECRET
    end
    @repos = JSON.parse(@resp.body)['items']
    render 'search'
  end
end
