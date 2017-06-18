class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req| 
  		req.params['q'] = params[:query]
  		req.params['client id'] = '8b0aaa22d8dd1c6d5ea6'
  		req.params['client_secret'] = '2877a6ae35c2bfe6704dfd654a63950abbece2ac'
  	end 

  	body = JSON.parse(@resp.body)
  	if @resp.success? 
  		@results = body["items"]
  	else 
  		@error = body["meta"]["errorDetail"]
  	end 
  	render 'search'
  end
end
