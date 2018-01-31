class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "aec580b6bb69d641fe36"
      req.params['client_secret'] = "a3ec1baae457e3a68464d5e70cf2d4aa9ea970cb"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = "no results found. please try again."
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
  render 'search'
  end
end
