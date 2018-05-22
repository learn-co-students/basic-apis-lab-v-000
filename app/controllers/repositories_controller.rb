class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    	req.params['client_id'] = '1153c8f17b0115886470'
    	req.params['client_secret'] = 'cbf01097fec24e2d18217456500b1d9b0da53060'
    	req.params['q'] = params[:query]
    end
  
	 	# binding.pry
	 body = JSON.parse(@resp.body)
	  if @resp.success?
	    @repos = body["items"]
	  else
	    @error = body["message"]
	  end
	  render 'search'
  end
end
