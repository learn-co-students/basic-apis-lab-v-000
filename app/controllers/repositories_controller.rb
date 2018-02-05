class RepositoriesController < ApplicationController
require 'pry'
  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params["client_id"] = "CLIENT_ID"
       req.params["client_secret"] = "CLIENT_SECRET"
       req.params["q"] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if body["total_count"]== 0
       @error = "Sorry! There is no repository with that name."
     else
       @repos = body["items"]
     end
     render 'search'
  end
end
