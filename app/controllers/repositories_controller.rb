class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = 'Iv1.02f41285ab1fb4df'
  		req.params['client_secret'] = '45635c05cc8903064f87f161cd86d298c2042a05'
  		req.params['q'] = params[:query]
  	end
  	@body = JSON.parse(@resp.body)
  	@name = @body["items"][0]["name"]
   	@url = @body["items"][0]["html_url"]
   	@description = @body["items"][0]["description"]

  	binding.pry
  	render 'search'
  end
end