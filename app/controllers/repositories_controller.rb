class RepositoriesController < ApplicationController

  def search
  end

  def github_search
  	client_id = '847d82cac5bf7d9369a7'
  	client_secret = '83a743010c40ff79993a4067eabe4ffd25557d44'

  	response = Faraday.get("https://api.github.com/search/repositories") do |request|
  		request.params["q"] = params[:query]
  		request.params["client_id"] = client_id
  		request.params["client_secret"] = client_secret
  	end

  	body = JSON.parse(response.body)
	  @results = body["items"]

	  render :search
  end
end