class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |resp|
  		resp.params['q'] = params[:query]
  	end
  	   body = JSON.parse(@resp.body)
  	   @repos = body["items"]
  	   render 'search'
  end 
end
