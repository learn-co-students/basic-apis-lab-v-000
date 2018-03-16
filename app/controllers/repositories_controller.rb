class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    begin
      response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.ab8ee520b1b1253c'
        req.params['client_secret'] = 'de1f34c8f3d2b5fa4916d7ff0015a272f804a27f'
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
