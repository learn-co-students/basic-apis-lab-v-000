class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    response = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = "5d750281b85b1bcdab49"
        req.params["client_secret"] = "971523ca4ecfc32ec8b18cfae9c949eeae99e1ad"
        end
       body = JSON.parse(response.body)
       @results = body["items"]
       render :search
      end
end
