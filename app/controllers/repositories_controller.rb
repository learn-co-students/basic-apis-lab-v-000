class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	client_id = "5dd223d3dd78adf88b36"
  	client_secret = "6c2d719cb76f482aa5d099944a7306c5db97b61f"
  	
  	begin
	  	@repository_response = Faraday.get 'https://api.github.com/search/repositories' do |req|
			req.params['client_id'] = client_id
			req.params['client_secret'] = client_secret
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

