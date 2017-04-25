class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @search = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '64ddbe433e2d20e0ca57'
      req.params['client_secret'] = '2a2ce26a15f87cea1177b087d1ba54b9f5fac71e'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@search.body)
    if @search.success?
      @items = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end

end