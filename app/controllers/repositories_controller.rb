class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          # req.params['client_id'] = 'Iv1.c9812a8124fe29a9' #need to put actual id and secret in as STRINGS
          # req.params['client_secret'] = '289897a0584fb7be25ac5fcf1a6da29ee989da44'
          # req.params['v'] = '20160201'
          req.params['client_id'] = "REPLACE WITH STRING"
          req.params['client_secret'] = "REPLACE WITH STRING"
          # req.params['access_token'] = '5a3460318687a87db820bef274b6e2358dda640b'
          req.params['q'] = params[:query]
          # req.params['query'] = 'coffee shop'

      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @result = body['items']
      else

        @error = "Sorry, error with @resp."
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end

end
