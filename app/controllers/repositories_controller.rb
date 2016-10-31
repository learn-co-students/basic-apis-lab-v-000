class RepositoriesController < ApplicationController
	require 'pry'
  def search

  end

  def github_search
  	@response = Faraday.get 'https://api.github.com/search/repositories' do |request|
  		request.params['client_id'] = 'no key for you'
  		request.params['client_secret'] = 'no secret for you! see gihub I can be secure!'
  		request.params['q'] = params[:query]
  	end
  	body = JSON.parse(@response.body)
  	if @response.success?
  		# binding.pry
  		@repos = body['items']
  	else
  		@error = body['meta']['error']
  	end
  	
  	render "search"
  end

end
