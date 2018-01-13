class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '8f913e2c9cfe9c5c5ef9'
        req.params['client_secret'] = '9b172514d236ebe0b8d8f61db1c8dffa5bd55dd2'
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body_hash["items"]
      else
        @error = body_hash["meta"]["errorDetail"]
      end
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
    end
  end
