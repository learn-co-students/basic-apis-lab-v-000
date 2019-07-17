class RepositoriesController < ApplicationController

  def search

  end

  

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '3231e48ce18bb36b56d8'
        req.params['client_secret'] = 'eb340d4a526d1a7781eb7241722577ad09bf2fc9'
        req.params['q'] = params[:query]
        req.options.timeout = 0
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
 
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
