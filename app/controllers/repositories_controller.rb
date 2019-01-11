class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # making a request to an api with Faraday
      
      resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = 'Iv1.8deb1cc2cd1de54c'
        req.params["client_secret"] = 'dd3c3a212b827381fbe86957f35b558991344412'
      end
  
      body = JSON.parse(resp.body)
      @results = body["items"]
      render :search
    end
end
