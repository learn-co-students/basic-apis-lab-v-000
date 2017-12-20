class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	# params[:query]
  	begin 
  		resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  			req.params['client_id'] = '0052edcd201c20bf9f65'
  			req.params['client_secret'] = 'ec6aa7e9d24b0c27e377b966e272ed096ed948e2'
  			req.params['q'] = params[:query]
  		end

  		body = JSON.parse(resp.body)
  		if resp.success?
  			@repos = body["items"]
  		else
  			@error = body["message"]
  		end

  	rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

end
