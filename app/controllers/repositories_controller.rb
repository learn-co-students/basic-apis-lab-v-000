class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = 'adfab454cba91b11b83f'
  		req.params['client_secret'] = 'a33aefc794b4c43d1a00b34d3e63dd4b1de147a6'
  		req.params['q'] = params[:query]
  	end
  		
  	body = JSON.parse(@resp.body)
  	if @resp.success?
  		@body = body["items"]
  	end
  		render 'search'
  	end
end
