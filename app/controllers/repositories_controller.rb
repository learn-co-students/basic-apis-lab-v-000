class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]


  rescue Faraday::TimeoutError
    @error = "There was a timeout. Please try again."
  end
  
  render 'search'
  end
end