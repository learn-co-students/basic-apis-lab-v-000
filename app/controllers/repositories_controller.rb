class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'ea2c775ddc585111043b'
        req.params['client_secret'] = '0d68088d3f4e5eb1e86d5ea9712c10404edcb568'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      @items = body["items"]
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again"
    end
    render 'search'
  end
end
