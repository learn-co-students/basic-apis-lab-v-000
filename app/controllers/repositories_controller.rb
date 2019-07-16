class RepositoriesController < ApplicationController
require 'pry'

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'c9ebcd6137f82d399ab9'
      req.params['client_secret'] = 'ae9d5a67ef2378f97cfb65029b68c075955b394e'
      req.params['id'] = '3081286'
      req.params['q'] = params[:query]
    end
    
    body_hash = JSON.parse(@resp.body)
    #binding.pry
      if @resp.success?
        
        @repositories = body_hash["items"]["name"]
        
      else
        @error = body["meta"]["errorDetail"]
      end
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end
end
