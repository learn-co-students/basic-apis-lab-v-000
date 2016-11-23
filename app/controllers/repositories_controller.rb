class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
		@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
			req.params['client_id'] = '27590390e4196bcc39cd'
			req.params['client_secret'] = '8e2e356b0704d62b0d97c7baf7daafd6b5a99937'
			# req.params['v'] = '20160201'
			req.params['q'] = params[:query]
			# req.params['query'] = 'coffee shop'
		end
    	body = JSON.parse(@resp.body)
		if @resp.success?
			@repositories = body["items"]
		else
			@error = body["message"]
		end
	rescue Faraday::TimeoutError
		@error = "There was a timeout. Please try again."
	end
    render 'search'
  end

end
