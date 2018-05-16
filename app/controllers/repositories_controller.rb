class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @search_term = params['query']
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params['query']
        req.options.timeout = 20
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = "Something has gone wrong, please try again."
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
