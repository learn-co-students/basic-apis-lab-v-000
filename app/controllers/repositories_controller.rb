class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end

      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body_hash
      else
        @error = body_hash["meta"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again later."
    end
    render 'search'
  end
end
