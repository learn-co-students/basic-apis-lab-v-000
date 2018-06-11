require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '37095742d311aa2bd12f'
      req.params['client_secret'] = '73147787795c817e3885a7c0cbb714843516ddd2'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
