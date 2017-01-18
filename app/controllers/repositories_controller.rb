class RepositoriesController < ApplicationController

  def search
  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = '71fb72604ac3eea48283'
  		req.params['client_secret'] = '33038897137e4be801d3dcbc3ca959dd8715d368'
  		req.params['q'] = params[:query]
  		req.params['per_page'] = '10000'
  	end
  	body = JSON.parse(@resp.body)
  	if @resp.success?
  		@results = body["items"]
  	else
  		@error = "error"
  	end
  		
  	render 'search'
  end
end
