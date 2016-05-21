class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '3dbf9127ffba028840ca'
        req.params['client_secret'] = '761d82e952943e532a20eab4d405ae0ad9eed1a0'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = "Search not found."
      end
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
      render 'search'
  end
end
