class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = 'client_id'
    client_secret = 'client_secret'

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
