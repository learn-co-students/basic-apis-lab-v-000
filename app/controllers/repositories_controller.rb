class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "653ec893b519d996cfce"
        req.params['client_secret'] = "e1075c5374d3e9c408c46a0a65133f14cdf03c31"
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @contents = body["items"]
      else
        @error = body["message"]
      end
   
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

end
