class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '1bf1bbaf53a92c93c0ad'
        req.params['client_secret'] = 'eb5b954d2eaea9d63c583b350f7ae12aa6f3a58c'
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      @repos = body_hash["items"]
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
