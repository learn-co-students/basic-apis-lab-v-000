class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '38e55ad078bb37492481'
        req.params['client_secret'] = '6cdb104c3f0bef9268ea94f83a3c5ba2eedb9919'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = body["message"]
      end

      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end

      render 'search'
  end
end
