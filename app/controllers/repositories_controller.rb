class RepositoriesController < ApplicationController
require 'pry'

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params[:query]\
      # req.options.timeout = 0
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @results = body_hash["items"]
    else
      @error = body_hash["meta"]["errorDetail"]
    end
    render 'search'
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    
end


