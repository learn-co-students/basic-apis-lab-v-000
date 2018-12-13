require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '8228216bc5949960e936'
      req.params['client_secret'] = '6442f8c17928df1fd0505126a64e0b5deb1b080e'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @details = body["items"]
      #binding.pry
    else
      @error = body["meta"]["errorDetail"]
    end

      rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
      end
    render 'search'

  end

end
