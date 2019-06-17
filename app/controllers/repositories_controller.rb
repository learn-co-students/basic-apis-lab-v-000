class RepositoriesController < ApplicationController

  def search
  end

  def github_search
  	begin
  		@response = Faraday.get 'https://api.github.com/search/repositories' do |req|
  			req.params['client_id'] = 'REDACTED'
  			req.params['client_secret'] = 'REDACTED'
  			req.params['q'] = params[:query]
  		end
  		if @response.success?
  			body = JSON.parse(@response.body)
  			@repos = body['items']
  		else
  			@error = body['error']
  		end

  	rescue Faraday::ConnectionFailed
  		@error = 'There was a timeout. Please try again.'
  	end
  	render 'search'
  end
end
