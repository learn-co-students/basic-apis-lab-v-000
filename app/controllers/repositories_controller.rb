class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params['client_id'] = '27a5ee254802985c75a7'
        req.params['client_secret'] = '9bdee513e9f2455f67f4fd3bcf93a48bcce9df3a'
        req.params['q'] = params['query']
      end
      body = JSON.parse(@resp.body)
      @repositories = body["items"]
      render :search

    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end
  end
end
