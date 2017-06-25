class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '458d3cab6771948d4bd2'
      req.params['client_secret'] = 'f0ca9679247222a4079d93e95c0adedaea6cb493'
      req.params['q'] = params[:query]
      
    end
    # binding.pry
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]

    @name = body_hash["items"][0]["name"]
    # binding.pry
    @description = body_hash["items"][0]["description"]
    @url = body_hash["items"][0]["url"]
    # binding.pry
    render 'search'

  end
end
