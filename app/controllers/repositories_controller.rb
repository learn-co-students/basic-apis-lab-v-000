class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
	  	@repository_response = Faraday.get 'https://api.github.com/search/repositories' do |req|
			req.params['client_id'] = '5dd223d3dd78adf88b36'
			req.params['client_secret'] = '6c2d719cb76f482aa5d099944a7306c5db97b61f'
			req.params['q'] = params[:query]
		  end
		
		body_hash = JSON.parse(@repository_response.body)
		if @repository_response.success?
			@repositories = body_hash["items"]
		else
			@error = body["meta"]["errorDetail"]	
		end

	rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

	render 'search'
	
  end

end
