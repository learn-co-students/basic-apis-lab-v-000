class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['client_id']
        req.params['client_secret'] = ENV['client_secret']
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body_hash['items']
      else
        @error = body_hash['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end
end
