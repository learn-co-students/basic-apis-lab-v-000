

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.20cc439e9379e5cb"
    client_secret = "50c6bae2195592f827a28731ac61b8a9d90028fc"
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret


    end

      response = JSON.parse(@resp.body)
      @items = response["items"]
      binding.pry
      render :search
  end
end
