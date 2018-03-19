class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get "https://api.github.com/search/repositories?" do |req|
        req.params['q'] = params[:query]
        req.options.timeout = 5
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = "There has been an error, please try again."
      end

    rescue
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
