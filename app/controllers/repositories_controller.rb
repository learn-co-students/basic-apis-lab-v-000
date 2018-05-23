class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '68b330224cdf915e8ffc'
        req.params['client_secret'] = 'b83f75c2d5a60339e56a20c531a045f37a356261'
        req.params['q'] = params[:query]
        # req.options.timeout = 1000
      end
  
      body_hash = JSON.parse(@resp.body)
  
      if @resp.success?
        @repos = body_hash["items"]
      else
        @error = body_hash["meta"]["errorDetail"]
      end
  
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout.  Please try again."
      end
    render 'search'
  end
end
