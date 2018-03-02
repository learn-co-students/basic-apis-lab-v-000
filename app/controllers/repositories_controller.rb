class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "62222494ac3aa85e8b94"
        req.params['client_secret'] = "b43eeec514a5783309be355c9e3e9de0acf909dd"
        req.params['q'] = params[:query]

      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again later."
    end
    render 'search'
  end
end
