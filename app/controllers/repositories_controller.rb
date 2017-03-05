class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @response = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['client_id'] = ENV["client_id"]
        req.params['client_secret'] = ENV["client_secret"]
        #req.params['accept'] = 'application/vnd.github.v3+json'
        req.params['q'] = params[:query]
        #req.options.timeout = 0
      end

      if @response.success?
        body_hash = JSON.parse(@response.body) 
        @repos = body_hash["items"]
            #ispect "stop"
      else
        @error = @response.message
      end
    rescue Faraday::TimeoutError 
      @error = "There was a timeout. Please try again."
    end  


    render 'search'

  end
end
