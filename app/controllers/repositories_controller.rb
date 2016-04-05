class RepositoriesController < ApplicationController

  def search

  end

  def github_search
	begin
	    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	        req.params['client_id'] = "6c3f77cf6b3ee9c99726"
	        req.params['client_secret'] = "84ff8b52876a69ac5775ede18f20c0566c699d42"
	        req.params['q'] = params[:query]
	        req.options.timeout = 100
	    end
	    body = JSON.parse(@resp.body)
        
        if @resp.success?
          @items = body["items"]
        else
          @error = body["errors"]
        end
	      
	    rescue Faraday::TimeoutError
	      @error = "There was a timeout. Please try again."
	    end
	    render 'search'
  end
end
