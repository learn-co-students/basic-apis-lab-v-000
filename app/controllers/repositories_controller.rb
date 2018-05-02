class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '433dfd0e70055ceed92b'
        req.params['client_secret'] = '600e2e3bf9817a8bb6fa759a7ee546250c4cabab'
	    req.params['q'] = params[:query]
	  end

	  body = JSON.parse(@resp.body)

	  if @resp.success?
	    @repos = body["items"]
	  else
	    @error = body["meta"]["errorDetail"]
	  end
	  render 'search'

	rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
    end
  end
end
