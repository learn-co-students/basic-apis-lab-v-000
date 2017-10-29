class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'e09e1f87d89fd3223340'
        req.params['client_secret'] = 'af45d420837774e03d18cd1b09a35d99a6706f79'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body['items']
      else
        @error = body['errors']
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
