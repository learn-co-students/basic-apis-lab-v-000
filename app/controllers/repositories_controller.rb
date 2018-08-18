class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  	@search = params["query"]
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = "Iv1.529e2add40cc0e74"
  		req.params['client_secret'] = "ae8d7f52741871bb0daa8fbb55d0ebdb0e460154"
  		req.params['q'] = @search
  		# req.params['near'] = params[:zipcode]
  		# req.params['query'] = 'coffee shop'
  	end

  	body_hash = JSON.parse(@resp.body)

  	if @resp.success?
			@repositories = body_hash["items"]
		else
			@error = body_hash["meta"]["errorDetail"]
		end

		# rescue Faraday::ConnectionFailed
		# 	@error = "There was a timeout. Please try again."
		# end
  	render 'search'
  end

end
