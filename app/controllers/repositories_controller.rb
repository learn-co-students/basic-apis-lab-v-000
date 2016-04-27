class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['GITHUB_ID']
        req.params['client_secret'] = ENV['GITHUB_SECRET']
        req.params['q'] = params['query']
      end

      body = JSON.parse(@response.body)

      if @response.success?
        @repositories = body['items']
      else
        @error = body['message']
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout error. Please try again."
    end

    render 'search'
  end
end
