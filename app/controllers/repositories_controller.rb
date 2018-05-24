class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories?q=' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = "Iv1.d84c0d175b3fe85a"
        req.params['client_secret'] = "222343c975e3c53714af63c31666fd88c47fc69b"
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = 'error'
      end

     rescue Faraday::ConnectionFailed
       @error = "There was a timeout. Please try again."
     end
     render 'search'
  end
end
