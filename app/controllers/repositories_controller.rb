class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      # if @resp.success?
        @items = body["items"]
      # else
      #   @error = body["meta"]["errorDetail"]
      # end

      # rescue Faraday::ConnectionFailed
      #   @error = "There was an error. Please try again."
      # end

      render 'search'

  end
end

# https://api.github.com/search/repositories
