class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	      req.params["client_id"] = ENV['GITHUB_KEY']
	      req.params["client_secret"] = ENV['GITHUB_SECRET']
	      req.params['q'] = params[:query]
	    end
	    body = JSON.parse(@resp.body)
	    begin
	    if @resp.success?
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
