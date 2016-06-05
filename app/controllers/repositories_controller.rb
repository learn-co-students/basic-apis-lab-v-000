class RepositoriesController < ApplicationController

  def search
    #render views/repositories/search
  end

  def github_search
     # set timeout rescue
     begin 
      # use Faraday.get() method to query API
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        #feed in the GitHub API params with values
        req.params['client_id'] = '3ddef568939a35a755e7'
        req.params['client_secret'] = '6311b6514b2ffb69ccee804b53e13c4a0ec37d78'
        req.params['q'] = params[:query]
      end
      # use JSON.parse to get just the body
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body_hash["items"]
      else
        @error = body_hash["message"]
      end
     rescue Faraday::TimeoutError
     @error = "There was a timeout. Please try again."
     end
    render 'search' 
  end

end
