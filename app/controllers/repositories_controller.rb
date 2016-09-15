class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] ='c281422e7yx327d2o56'
        req.params['client_secret'] = 'i6i21uxck7265bu8a498fn3x624pp3c8d8127918'
        req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body
    else
      @error = "Not found"
    end

    rescue Faraday::TimeoutError
      @error = "There was a timeout error"
    end
    render 'search'
  end
end
