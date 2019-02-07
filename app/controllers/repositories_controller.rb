class RepositoriesController < ApplicationController

  def search
  end

  def github_search
  	begin
	  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	      req.params['client_id'] = '8800257d0acae7c0f681'
	      req.params['client_secret'] = '8ef09fe515e8bb6743077b65f432f83189455e2c'
	      req.params['q'] = params[:query]
	    end

	    body = JSON.parse(@resp.body)
		if @resp.success?
			@repos = body["items"]
		else
		   @error = body["meta"]["errorDetail"]
		end

		rescue Faraday::ConnectionFailed
			@error = "There was a timeout. Please try again."
    	end

	    render 'search'
  end

end
