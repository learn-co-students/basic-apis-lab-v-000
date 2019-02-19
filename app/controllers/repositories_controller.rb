class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q']= params[:query]
        req.params['sort'] = 'stars'
        req.params['order'] = 'desc'
      end

      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body_hash["items"]
      else
        @error = body_hash["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
