require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = '53a5d02f2b678f1dab3a'
  		req.params['client_secret'] = 'bc2f1e87c6af347f4289d6f14bc455e61fc5775a'
 		req.params['q'] = params['query']
 	end
 	
 	test = JSON.parse(@resp.body)
 	@results = test["items"]
 
 	render 'search'

 
  end


end
