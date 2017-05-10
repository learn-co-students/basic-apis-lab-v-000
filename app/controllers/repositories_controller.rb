class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    #req.params['client_id'] = 'ba6dc8ad21cc00a24136'
    #req.params['client_secret'] = '98e2bc0b5a6872570e9f93f7980396daa384dda6'
    #req.params['v'] = '20160201'
    req.params['q'] = params[:query]
	end
 
  body = JSON.parse(@resp.body)
  @results=body['items']
  render 'search'
  end
end
