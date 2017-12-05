class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = 'Iv1.8d24331d823078d9'
  		req.params['client_secret'] = '70e55461c4acb518bf947e375a7d8733d679ba9b'
  		req.params['q'] = params[:query]
  	end
  	body_hash = JSON.parse(@resp.body)
  	@items = body_hash["items"]
  	render 'search'
  end

end
