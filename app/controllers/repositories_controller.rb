class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0a31e4783fbe8cb88670'
      req.params['client_secret'] = '1809a92fbab5bb01f6e5017704eea583a0f90a35'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body_hash["items"]
      # binding.pry
      # @venues = body_hash["response"]["venues"]
    else
      @error = body_hash["message"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
