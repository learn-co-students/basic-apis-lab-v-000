class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req| 
        req.params['q'] = params[:query]
        req.params['client_id'] = 'a1ab4290997a4c9be8f5' 
        req.params['client_secret'] = 'a1ab4290997a4c9be8f5' 
      end 
      body = JSON.parse(@resp.body)
      if @resp.success? 
        @repos = body['items']
      else 
        @error = "An error occurred. Please try again."
      end 

    rescue Faraday::ConnectionFailed 
      @error = "There was a timeout. Please try again."
    end 
    render 'search'
  end
end
