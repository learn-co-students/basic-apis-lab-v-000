class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        # req.params['client_id'] = 'xxx'
        # req.params['client_secret'] = 'yyy'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = "something went wrong. please try again"
      end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
    end
end
