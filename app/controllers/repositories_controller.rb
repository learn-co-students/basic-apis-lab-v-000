class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin 
	  	resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	  		#header
	  		# req.params['accept'] = 'application/vnd.github.v3+json'
	  		req.params['client_id'] = git_auth[:client_id]
	  		req.params['client_secret'] = git_auth[:client_secret]
	  		#perameters
	  		req.params['q'] = params[:query]
	  	end

	  	body_hash = JSON.parse(resp.body)
	  	if resp.success?
	  		@items = body_hash['items']
	  	else
	  		@error = body_hash['meta']['errorDetail']
	  	end
  	rescue Faraday::ConnectionFailed
  		@error = "Somthing went wrong. Try again."
    end
  	render 'search'
  end

  private

  def git_auth
  	{   
  		:client_id => 'ebdedc5ad5ca81d84b8f',
  		:client_secret => '3794d6eb64d2a74e4eecbda1d0b97fbba8d55638'
  	}
  end
end
