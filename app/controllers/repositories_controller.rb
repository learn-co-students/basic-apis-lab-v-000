class RepositoriesController < ApplicationController
  require 'pry'
  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '29bf561992422c84ac7d'
      req.params['q'] = params[:query]
      req.params['client_secret'] = 'dcaa8380a067e65103057db20470e24893759dc4'
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body["items"]
    end
    render 'search'
    end
end
