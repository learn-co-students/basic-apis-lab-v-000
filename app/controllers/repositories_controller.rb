class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.3a3dfa1d2f38470e'
      req.params['client_secret'] = 'f163e528b4013a1dbd28162601c0b1b7e0e0c7d2'
      req.params['v'] = 'v3'
      req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @link = body["items"][0]["html_url"]
        @description = body["items"][0]["description"]
      else
        @error = body["meta"]["errorDetail"]
      end
    #
    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end
    render 'search'
  end

end
