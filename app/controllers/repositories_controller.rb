class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['token'] = 'my token here'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      @repos = body["items"]
    rescue Faraday::TimeoutError
      @error = "There is a timeout. Please try again."
    end
    render 'search'
  end
end
