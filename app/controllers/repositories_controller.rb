class RepositoriesController < ApplicationController
  require 'pry'
  def search
  end

  #ENTER YOUR CLIENT ID AND SECRET

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['v'] = '20160201'
      req.params['q'] = params[:query]
    end
    # We NEED TO PARSE THE RESPONSE INTO JSON
    body = JSON.parse(@resp.body)
    @results = body["items"]
    
    render 'search'
  end

end