class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        # req.params['in:language'] = "assembly"
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
