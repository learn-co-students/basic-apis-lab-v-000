class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '872d80785cd64ce72e50'
      req.params['client_secret'] = '5675147eaac8282785415ff75a1952d0597d16f9'
      req.params['q'] = params[:query]
    end
 
    body = JSON.parse(@resp.body)
  if @resp.success?
    @items = body["items"]
  else
    @error = body
  end

     rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end

  render 'search'

  end
end
