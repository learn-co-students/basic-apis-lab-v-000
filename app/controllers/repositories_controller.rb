class RepositoriesController < ApplicationController

  def search
  end

  def github_search
		begin
	    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	        req.params['client_id'] = 'Iv1.f66366fa1903ee89'
	        req.params['client_secret'] = 'ef2d9c4278a8be879da8477f5c60847f7260853e'
	        req.params['v'] = 'v3'
	        req.params['query'] = params[:query]
	        req.options.timeout = 1000
	      end
	      body = JSON.parse(@resp.body)
	      if @resp.success?
	        @results = body["response"]["RESULT KEY"]
	      else
	        @error = body["meta"]["errorDetail"]
	      end
	 
	    rescue Faraday::ConnectionFailed
	      @error = "There was a timeout. Please try again."
	    end
	    render 'search'
	end
  end

end
