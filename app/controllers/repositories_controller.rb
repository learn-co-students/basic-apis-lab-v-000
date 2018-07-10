class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    search_term = params[:query]
	   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	    req.params['client_id'] = ''
	    req.params['client_secret'] = ''
	    req.params['q'] = search_term
    end

  	body = JSON.parse(@resp.body)

  	if @resp.success?
    	@repos = body["items"]
  	else
    	@error = body["meta"]["errorDetail"]
  	end
    render 'search'
  end
end
