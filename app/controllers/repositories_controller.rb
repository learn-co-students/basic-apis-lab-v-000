require 'pry'

class RepositoriesController < ApplicationController

  def search
      
  end

  def github_search
    # binding.pry
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 'a874aa63c8bec49e500f'
          req.params['client_secret'] = '28716b16c10ae3265e30e231b84c53c69f9ce6e8'
          req.params['q'] = params['query']
          req.options.timeout = 2
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @repos = body["items"]
        else
          @error = body["meta"]["errorDetail"]
        end
   
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'

  end
end
