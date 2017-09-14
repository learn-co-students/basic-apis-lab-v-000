class RepositoriesController < ApplicationController



  def search

  end

  def github_search
  	@results = Faraday.get("https://api.github.com/search/repositories") do |req|
  		req.params['q'] = params[:query]
  		req.params['client_id'] = "f0f6f0107f6cc6716d8b"
  		req.params['client_secret'] = "882188e8b15f1667cb3e5ab0cb6be991ee015c90"
  	end

  	body_hash = JSON.parse(@results.body)
  	@repos = body_hash['items']
  	render 'search'
  end
end
