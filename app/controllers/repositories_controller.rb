class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params['client_id'] = '27a5ee254802985c75a7'
        req.params['client_secret'] = '9bdee513e9f2455f67f4fd3bcf93a48bcce9df3a'
        req.params['v'] = '20160201'
        req.params['q'] = params['searchTerms']
      end
      binding.pry
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["errors"].join(" ")
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
  end
end
