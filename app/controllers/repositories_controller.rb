class RepositoriesController < ApplicationController

  def search

  end

  def github_search
	    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	      req.params['client_id'] = 'Iv1.223eb25bcb546bc2'
	      req.params['client_secret'] = '5ba30d215abf863d4bb7c1707e17d29fa0b252cf'
	      req.params['q'] = params[:query]
	      req.params['sort'] = 'stars'
	    end
		  body = JSON.parse(@resp.body)
		  if @resp.success?
		    @repositories = body['items']
		  end
	  render 'search'
  end
end
