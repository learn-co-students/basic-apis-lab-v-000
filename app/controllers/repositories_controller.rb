require 'pry'
class RepositoriesController < ApplicationController
  @@client_id = 'Iv1.08fca863667775d4'
  @@client_secret = '8736b729987fb0a380e82491db75e5bef285eeaa'

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = @@client_id
        req.params['client_secret'] = @@client_secret
        req.params['q'] = params[:query]
        req.options.timeout = 5   # 0 seconds to force timeout error for testing
      end
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body_hash["items"]
      else
        @error = body_hash["message"]
      end
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
    end
    render 'search'    
  end
end
