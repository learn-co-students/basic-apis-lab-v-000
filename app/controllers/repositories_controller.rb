class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin 
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = '' #Delete this before submitting
        req.params['client_secret'] = '' #Delete this before submitting
        req.options.timeout = 10
      end
      
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = body['meta']['errorDetail']
      end
    
    rescue Faraday::ConnectionFailed
      @error =  "There was a timeout. Please try again."
    end
    
    render 'search'
  end
  
end
