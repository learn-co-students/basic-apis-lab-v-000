class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	resp = Faraday.get('https://api.github.com/search/repositories') do |req|
  		# req.params['client_id'] = '324eea2a690a415c4728'
  		# req.params['client_secret'] = '8d8acf40a4ecc782d7f77b449d60ac9f4ab833a4'
  		req.params['q'] = params[:query]
  	end

  	body = JSON.parse(resp.body)
  	@resp = body['items']

  	render 'search'

  end
end
