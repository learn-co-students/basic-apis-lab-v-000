class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "e0dcdb51fd3452110bc5"
        req.params['client_secret'] = "5db2437b7641584de2b6e499d2dee9a6d70495c6"
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body["items"]
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end

end
