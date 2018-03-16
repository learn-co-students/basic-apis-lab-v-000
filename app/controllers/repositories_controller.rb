class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    begin
      response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = <client_id>
        req.params['client_secret'] = <client_secret>
        req.params['q'] = params[:query]
        # req.options.timeout = 0
      end
      body = JSON.parse(response.body)
      if response.success?
        @response_hash = body
      else
        @error = body
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
