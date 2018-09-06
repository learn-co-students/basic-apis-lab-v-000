class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '3c7871974ba484303aa5'
        req.params['client_secret'] = '7550b15576ed4d76dda20a9c5b06d0ce2adb7707'
        req.params['q'] = params[:query]
        #req.options.timeout = 0
      end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end
    render 'search'
  end

end
