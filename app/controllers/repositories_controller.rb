class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      url = 'https://api.github.com/search/repositories'

      @resp = Faraday.get url do |req|
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @results = body["items"]
      else
        @error = body["message"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
  
  render 'search'
  end

end
