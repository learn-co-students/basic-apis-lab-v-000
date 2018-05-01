class RepositoriesController < ApplicationController
  require 'pry'
  def search
  end

  def github_search
    query = params[:query]
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = ENV['GITHUB_KEY']
          req.params['client_secret'] = ENV['GITHUB_SECRET']
          req.params['q'] = query
        end
        body = JSON.parse(@resp.body)
        binding.pry
        # if @resp.success?
        #   @results = body["response"]["venues"]
        # else
        #   @error = body["meta"]["errorDetail"]
        # end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
    render 'search'
  end
end
