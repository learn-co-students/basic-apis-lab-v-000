class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@query = params[:query]
  	begin
	  	@results =  Faraday.get('https://api.github.com/search/repositories') do |req|
	  		req.params['q'] = @query
	  		req.params['client_id'] = 'REPLACE'
	  		req.params['client_secret'] = 'REPLACE'
	  		req.options.timeout = 20
	  	end
	  	@body = JSON.parse(@results.body)

	  	if @results.success?
		  	@count = @body['total_count']
		  	@items = @body['items']
	  	else
	  		@error = "Error, try again"
	  	end


	 rescue Faraday::TimeoutError
	 	@error = "Timeout Error, try again later."
	 end 	

  	render :search
  end
end
