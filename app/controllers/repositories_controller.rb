class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ' 3b702e50-a08d-11e7-87ec-a59e1037a22e'
        req.params['client_secret'] = '9d28bea71391cc51d128039c301eed4ec76fa033'
        req.params['v'] = '20160201'
        req.params['q'] = params[:query]

      end

      body = JSON.parse(@resp.body)
      # binding.pry
      @items = body["items"]
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout.  Please try again."
    end
    render 'search'

  end
end
