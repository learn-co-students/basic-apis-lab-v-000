class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '6a370882f76354562adc'
        req.params['client_secret'] = '3d77f23b067966488ce1ffd46e338d8ec280d5ed'
        req.params['q'] = params[:query]
      end

      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @results = body_hash['items']
      else
        @error = "Something has gone wrong."  
      end      
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
