class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  		@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = '57971ddacdcf4245823e'
  		req.params['client_secret'] = '83f6ae28ef2a1d703b3b1f1727dd5bd519133e10'
  		#req.params['v'] = 'v3'
  		#req.params['near'] = params[:zipcode]
  		req.params['q'] = params[:query]
  		
  	end

  	body = JSON.parse(@resp.body)

  	@repos = body["items"]	
  	#if @resp.success? 
  	#	@repos = body["response"]["items"]	
  	#else 
  #		@error = body["meta"]["errorDetail"]
  #	end
  	render 'search'	
  

  end
end


# name, link, description 