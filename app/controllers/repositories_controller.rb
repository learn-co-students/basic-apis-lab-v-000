#require 'faraday'
require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
            req.params['client_id'] = '9ec7b3f2516eeab92065'
            req.params['client_secret'] = '39918fd824953aa10efb0f309e233bdec1fe6898'
            req.params['q'] = params[:query]
          end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    @name = body_hash['items'][0]["name"]
    @url = body_hash['items'][0]["html_url"]
    @des = body_hash['items'][0]["description"]
   
    render 'search'
   
  end
end
