class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = 'Iv1.cfaeec375d3cb1a3'
  		req.params['client_secret'] = '62c5759549a31b5b21b57ded198fce8c04d50385'
  		req.params['q'] = params[:query]
  	end

  	body = JSON.parse(@resp.body)
  	@items = body['items']
  	
  	render 'search'
  end
end
