class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
    end
    body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @results =  body_hash['items']
      else
        @error = body_hash['message']
      end

      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end
    render 'search'
  end
end
