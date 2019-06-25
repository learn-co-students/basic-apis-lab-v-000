require 'pry'

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = '65d24f9568f1299346ca'
          req.params['client_secret'] = 'a5b54e85673789e5b2fe00cc67fc49ad6d45fb62'
          req.params['q'] = 'tetris'
        end
        body = JSON.parse(@resp.body)
        
        if @resp.success?
          @repositories = body["items"]
        else
          @error = body["meta"]["errorDetail"]
        end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end
end
