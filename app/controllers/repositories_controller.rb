class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ENV['client_id']
      req.params['client_secret'] = ENV['client_secret']
      req.params['q'] = params[:query]
      req.options.timeout = 10
    end

    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body_hash['items']
    else
      @error = 'error'
    end

    rescue Faraday::ConnectionFailed
      @error = "The request to the server timed out. Please try again."
    end
    render 'search'
  end
end
