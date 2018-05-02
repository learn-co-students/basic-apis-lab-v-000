class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = '13f51284065e3ae73233'
  		req.params['client_secret'] = '356dc4e30e128d88184a12733861481be529e72c'
  		req.params['q'] = params[:query]
  	end
  	body = JSON.parse(@resp.body)
  	@results = body["items"]
  	render 'search'	
  end
end
