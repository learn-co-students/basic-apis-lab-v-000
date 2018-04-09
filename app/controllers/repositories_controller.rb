class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'Iv1.77304b4318d257dc'
        req.params['client_secret'] = '15d974ae466a662515ea8a9cf51d4de37335d615'
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body['items']
      else
        @error = body['message']
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end

# body = JSON.parse(@resp.body)
# if @resp.success?
#   @venues = body["response"]["venues"]
# else
#   @error = body["meta"]["errorDetail"]
# end
# rescue Faraday::ConnectionFailed
# @error = "There was a timeout. Please try again."
# end
# render 'search'