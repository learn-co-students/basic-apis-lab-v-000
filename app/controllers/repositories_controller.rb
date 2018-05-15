class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/respositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = ENV['GITHUB_ID']
        req.params['client_secret'] = ENV['GITHUB_SECRET']
      end

      body = JSON.parse(@resp.body)
      # if @resp.success?
        @repositories = body['items']
    #   else
    #     @error = body['message']
    #   end
    # rescue Faraday::ConnectionFailed
    #   @error = 'There was a timeout issue. Please try again.'
    # end
    render 'search'
  end
end
