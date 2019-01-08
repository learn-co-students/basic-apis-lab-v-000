class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
  		@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		  req.params['client_id'] = "cd1baa3cf1eaedac82c6"
          req.params['client_secret'] = "f5bd776a69d684532565f90f9621cc4bbef6ac64"
          req.params['q'] = params[:query]
  		end
  		body = JSON.parse(@resp.body)
  		
  		if @resp.success?
          @repositories = body["items"]
        else
          @error = body["message"]
        end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  	
  end

end
