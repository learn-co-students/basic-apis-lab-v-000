class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    		req.params['q'] = params[:query]
    		req.params['client_id'] = 'apalski'
    		req.params['client_secret'] = 'a61da8c37af06eff3c38ba26704586332f40b045'
    	end	
    	body_hash = JSON.parse(@resp.body)
    	if @resp.success?
    		@repos = body_hash["items"]
    	else
    		@error = body_hash["message"]
    	end
    rescue Faraday::TimeoutError
      @error = "Your request timed out. Please try again"  
    end  
  	render 'search'	
  end
end
